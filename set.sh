# installing all bounty tools on a server
sudo apt update && sudo apt upgrade
sleep 2
sudo apt install -y wget git curl apache2 net-tools make build-essential python3-pip whois jq libpcap-dev
sleep 2

echo "installing dns resolvers and moving them to the opt folder"
wget https://raw.githubusercontent.com/trickest/resolvers/main/resolvers.txt && sudo mv resolvers.txt /opt/wordlist
sleep 2

echo "Installing the dns wordlist from assetnote"
wget https://wordlists-cdn.assetnote.io/data/manual/best-dns-wordlist.txt && sudo mv best-dns-wordlist.txt /opt/wordlist
sleep 2

echo "installing wordlist for subdomain permutation bruteforcing"
wget https://gist.githubusercontent.com/kljunowsky/4cced0ed33c638590676513a0473ad78/raw/6889b98a8a05d2e6a721f7a9939fcff5de493296/subdomains-permutation-words.txt
sleep 2

echo "installing massdns"
git clone https://github.com/blechschmidt/massdns.git && cd massdns && make && sudo make install && cd
sleep 2

# installing go 
curl -OL https://go.dev/dl/go1.20.4.linux-amd64.tar.gz
sleep 2


echo "installing subfinder"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest


echo " "
echo "installing naabu for portscanning----------------------------"
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest


echo "installing httpx--------------------------------------------"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

echo "installing ffuf"
go install github.com/ffuf/ffuf/v2@latest

echo "installing jsluice"
go install github.com/BishopFox/jsluice/cmd/jsluice@latest

echo "installing puredns"
go install github.com/d3mondev/puredns/v2@latest


echo "installing gauplus"
go install github.com/bp0lr/gauplus@latest

echo "installing amass"
go install -v github.com/owasp-amass/amass/v3/...@master

echo "installing mapcidr"
go install -v github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest

echo "installing assetfinder"
go install github.com/tomnomnom/assetfinder@latest

echo "installing waybackurls"
go install github.com/tomnomnom/waybackurls@latest

echo "installing anew"
go install -v github.com/tomnomnom/anew@latest

echo "installing dnsx"
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest

echo "installing unfurl"
go install github.com/tomnomnom/unfurl@latest

echo "installing graphqlmaker"
go install github.com/xssdoctor/graphqlMaker@latest

echo "instaling fff for fast fetching"
go install github.com/tomnomnom/fff@latest

echo "installing getJs fast fetching of js urls"
go install github.com/003random/getJS/v2@latest

echo "installing certificate enumeration tools"
git clone https://github.com/UnaPibaGeek/ctfr.git && cd ctfr/ && pip3 install -r requirements.txt --break-system-packages && sudo chmod +x ctfr.py ; sudo ln -s $(pwd)/ctfr.py /usr/local/bin/ctfr ; cd ..  && ls -l /usr/local/bin/ctfr


echo "Installing graphwoof file"
git clone https://github.com/dolevf/graphw00f.git && cd graphw00f/ &&  pip3 install -r requirements.txt --break-system-packages && mv main.py graphwoof.py ;chmod +x graphwoof.py; sudo ln -s $(pwd)/graphwoof.py /usr/local/bin/graphwoof ; cd .. && ls -l /usr/local/bin/ctfr

echo "installing graphqlcop"
git clone https://github.com/dolevf/graphql-cop.git &&  cd graphql-cop/ && pip install -r requirements.txt && mv graphql-cop.py graphqlcop.py && chmod +x graphqlcop.py && sudo ln -s $(pwd)/graphqlcop.py /usr/local/bin/graphqlcop ; cd && ls -l /usr/local/bin/graphqlcop


echo "installing waymore"
pip install --upgrade waymore

echo "installing Altdns permutation generator"
pip3 install py-altdns==1.0.2 --break-system-packages


# TODO: - install graphwoof : DONE
#       - install graphqlcop : DONE
#       - shortscan url tool : NOT URGENT
#       - install clairvoyance : NOT URGENT

# echo "installing katana -----------------------------------------"
# go install github.com/projectdiscovery/katana/cmd/katana@latest

# echo "installing"
# go install github.com/gwen001/github-subdomains@latest

# echo "installing gitlab subdomains"
# go install github.com/gwen001/gitlab-subdomains@latest


# echo "installing crobat"
# git clone https://github.com/Cgboal/SonarSearch.git && git cd SonarSearch && make && make install && cd

# already have a resolvers txt file
# echo "instaalling dns validator"
# git clone https://github.com/vortexau/dnsvalidator.git && cd dnsvalidator/ && pip install -r requirements.txt && sudo python3 setup.py install && cd 
# && dnsvalidator -tL https://public-dns.info/nameservers.txt -threads 100 -o resolvers.txt

