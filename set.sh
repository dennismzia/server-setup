# installing all bounty tools on a server
sudo apt update && sudo apt upgrade

sudo apt install wget git curl htop apache2 net-tools make build-essential

# installing go 
wget https://go.dev/dl/go1.20.4.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.20.4.linux-amd64.tar.gz
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH' >> ~/.bashrc 

echo "installing subfinder"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

echo "installing katana -----------------------------------------"
go install github.com/projectdiscovery/katana/cmd/katana@latest
echo " "

echo "installing httpx--------------------------------------------"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

echo "installing ffuf"
go install github.com/ffuf/ffuf/v2@latest

echo "installing massdns"
git clone https://github.com/blechschmidt/massdns.git && cd massdns && make && sudo make install && cd

echo "installing puredns"
go install github.com/d3mondev/puredns/v2@latest

