# installing all bounty tools on a server
sudo apt update && sudo apt upgrade

sudo apt install -y wget git curl htop apache2 net-tools make build-essential python3-pip whois jq libpcap-dev

echo "installing dns resolvers and moving them to the opt folder"
wget https://raw.githubusercontent.com/trickest/resolvers/main/resolvers.txt && mv resolvers.txt /opt/

echo "installing massdns"
git clone https://github.com/blechschmidt/massdns.git && cd massdns && make && sudo make install && cd

# installing go 
wget https://go.dev/dl/go1.20.4.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.20.4.linux-amd64.tar.gz
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH' >> ~/.bashrc 

echo "installing subfinder"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# echo "installing katana -----------------------------------------"
# go install github.com/projectdiscovery/katana/cmd/katana@latest
echo " "

echo "installing naabu for portscanning----------------------------"
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest


echo "installing httpx--------------------------------------------"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

echo "installing ffuf"
go install github.com/ffuf/ffuf/v2@latest



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

echo "installing certificate enumeration tools"
git clone https://github.com/UnaPibaGeek/ctfr.git && cd ctfr/ && pip3 install -r requirements.txt --break-system-packages && sudo chmod +x ctfr.py

echo "installing Altdns permutation generator"
pip3 install py-altdns==1.0.2 --break-system-packages

# echo "installing dnsx"
# go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest


# echo "installing"
# go install github.com/gwen001/github-subdomains@latest

# echo "installing gitlab subdomains"
# go install github.com/gwen001/gitlab-subdomains@latest


# echo "installing unfurl"
# go install github.com/tomnomnom/unfurl@latest


# echo "installing crobat"
# git clone https://github.com/Cgboal/SonarSearch.git && git cd SonarSearch && make && make install && cd

# already have a resolvers txt file
# echo "instaalling dns validator"
# git clone https://github.com/vortexau/dnsvalidator.git && cd dnsvalidator/ && pip install -r requirements.txt && sudo python3 setup.py install && cd 
# && dnsvalidator -tL https://public-dns.info/nameservers.txt -threads 100 -o resolvers.txt

