#!/bin/bash

#colors
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
reset=`tput sgr0`

figlet -f Elite "Visual Recon" | lolcat 
echo " "

echo "${magenta}Welcome to visual recon tool ${reset}"
echo "${yellow}Created by :${red}kaligone ${reset}"
echo " "
read -p "Enter domain name (example.com): " DOM  # DOM contains the target url

if [ -d ~/Desktop/ ]
then
  echo " "
else
  mkdir ~/Desktop
fi

if [ -d ~/Desktop/$DOM ]
then
  echo " "
else
  mkdir ~/Desktop/$DOM

fi

if [ -d ~/Desktop/$DOM/Visual_Recon ]
then
  echo " "
else
  mkdir ~/Desktop/$DOM/Visual_Recon

fi


# checking dependecies and installing if not found
if [ -f /usr/bin/subfinder ]
then 
  echo "${blue}[+] Requirement 1 satisfied ....${reset}"
else
  echo "${red}[-]ERROR : Subfinder is not installed ${reset}"
  echo "${blue} [+] Installing Subfinder ${reset}"
  go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
  if [ -f /usr/bin/assetfinder ]
  then
    echo "${blue}[+] subfinder -  Requirement 1 satisfied ....${reset}"
  else
    echo "${blue} [+]Trying Installing subfinder ${reset}"
    sudo apt install subfinder
  fi
fi

if [ -f /usr/bin/httpx-toolkit ]
then
  echo "${blue}[+] httpx-toolkit - Requirement satisfied ....${reset}"
else
  echo "${red}[-]ERROR : httpx-toolkit is not installed ${reset}"
  echo "${blue} [+] Installing httpx-toolkit ${reset}"
  sudo apt install httpx-toolkit
fi

if [ -f /usr/bin/aquatone ]
then 
  echo "${blue}[+] aquatone - Requirement  satisfied ....${reset}"
else
  echo "${red}[-]ERROR : aquatone is not installed ${reset}"
  echo "${blue} [+] Installing aquatone ${reset}"
  go get github.com/michenriksen/aquatone
fi

echo "${magenta}[+] Starting Visual Recon ${reset}"
echo " "

#screenshotting
echo "${yellow} ---------------------------------- xxxxxxxx -------------------------------->"
echo " "

# starting with the visual recon
if [ -z "$DOM" ]
then
  echo "No input url given"
else
  subfinder -d $DOM -silent | httpx-toolkit -title -sc -silent | aquatone -http-timeout 10000 -scan-timeout 300 -ports xlarge -out ~/Desktop/$DOM/Visual_Recon
fi

echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"
echo ""
echo "${blue} [+] Successfully saved the results"
echo ""
echo "${yellow} ---------------------------------- xxxxxxxx ---------------------------------- ${reset}"
