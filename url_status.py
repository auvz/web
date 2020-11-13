import requests, sys, re
from requests.packages.urllib3.exceptions import InsecureRequestWarning
from socket import gethostbyname, gaierror

if len(sys.argv) < 2:
    print("\nUsage: " + sys.argv[0] + " <file containing URLs>\n")
    sys.exit()

#Returns the HTTP status of the URL
def main():
    with open(url_list, 'r') as f:
        print("Checking URL status...\n")
        errors = []
        for url in f.readlines(): 
            if re.search('^http',url):
                url=url.rstrip('\n')
            else:
                url="https://"+url.rstrip('\n')
#            url=url.rstrip('\n')
            requests.packages.urllib3.disable_warnings(InsecureRequestWarning)
            try:
                r = requests.head(url, verify=False)
                print ("[+]",url,"-", r.status_code)
            except (OSError, requests.ConnectionError, requests.exceptions.HTTPError) as err:
                err = "- Hostname Error"
               #print("[-]",url,err)
                errors.append(url) 
        print("")
        if errors: 
            print("[!] The following hostname(s) may be invalid:", *errors,sep='\n')
            print("")
url_list = sys.argv[1]
main()
