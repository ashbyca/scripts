#!/usr/bin/bash

# Housekeeping
cd ~/Users/${USER}

# Download and apply personal terminal settings
wget https://github.com/ashbyca/dotfiles/blob/master/bash_profile
wget https://raw.githubusercontent.com/ashbyca/dotfiles/master/IR_Black.terminal

# Install Xcode Command Linke Tools
xcode-select --install

# Upgrade pip
pip install --upgrade pip

# Install Home-brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install Common Tools
brew install wget
brew install click
brew install libmagic
pip install libmagic
pip install python-magic
easy_install click

#Install pwn_check - https://github.com/danlopgom/pwn_check
git clone https://github.com/danlopgom/pwn_check.git
cd pwn_check
pip3 install -r requirements.txt

# Install SearchSploit
pip3 install cve_searchsploit

# Install getsploit
pip install getsploit

# Install Machinae
sudo pip3 install git+https://github.com/HurricaneLabs/machinae.git
wget https://github.com/HurricaneLabs/machinae/raw/master/machinae.yml && sudo mv machinae.yml /etc/

# Install Shodan CLI
easy_install shodan

# Install Powershell
brew cask install powershell

# Install censys CLI - https://github.com/censys/censys-command-line
sudo pip3 install censys-command-line
