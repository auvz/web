#function to resolve hostnames and store variable in array
resolve_hostname() {
	for host in "${varhost[@]}";
	do 
		ip_arr+=("`host $host | awk '/has address/ { print $4 }'`")
	done

# Use this notation
# ${array[@]:offset:length}
# array[@] is all the elements, 0 is the offset (always is 0-based), and 1 is the number of elements desired.

if [[ ${ip_arr[@]:0:1} == "" ]]; then 

# TODO - logic is stuffed, if one host resolves and one doesn't then it'll still return the below error
		printf '[!] Unable to resolve hostnames'
	else
		echo '[+] A route for the following will be added:'
	fi
printf '%s\n' "${ip_arr[@]}"
}

# calls the resolve_hostname function and adds routes to the hardcoded VPN gateway i.e. 10.1.1.1
# if you want to preserve spaces, use quotation marks around the array, but this screws up the script

add_routes() {
	resolve_hostname
	for ip in ${ip_arr[@]};
	do
		sudo route add $ip -netmask 255.255.255.255 10.1.1.1 > /dev/null
# decide whether to redirect STDOUT and STDERR to /dev/null (&>)
# just STDERR (2>)
		sleep 0.5
	done
}

# -p   Display the attributes and values of each name. When '-p' is used, additional options are ignored.

echo '[*] Enter Hostnames (seperated by a space):'
read -a varhost
echo ''
declare -a ip_arr
add_routes
