#function to resolve hostnames and store variable in array
resolve_hostname() {
        for host in "${varhost[@]}";
        do
                ip_arr+=("`host $host | awk '/has address/ { print $4 }'`")
        done
echo 'Routes for the following IP will be added:'
printf '%s\n' "${ip_arr[@]}"
}


#calls the resolve_hostname function and adds routes to the VPN gateway variable
add_routes() {
        resolve_hostname
        for ip in ${ip_arr[@]};
        do
        sudo route add $ip -netmask 255.255.255.255 $vpn
        sleep 1
        done
}

echo Enter hostname:
read -a varhost
echo Enter vpn IP gateway:
read vpn
declare -a ip_arr
add_routes
