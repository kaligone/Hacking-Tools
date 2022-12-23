#!/bin/bash

printf "\n"
figlet -f big "SubDcrawl" | lolcat

printf "\t\t\t\t\t\tCreated by : \033[1;91mKALIGONE\n"
printf "\t\t\t\t\t\tAll rights are reserved"

printf "\n\n\n\n"
printf "\033[1;91mDISCLIAMER :  "
printf "\033[0mThis tool is made only for education purpose.\nCreater is not responsible for any kind of unethical use of tool"
printf "\033[0m\n\n"

# Tools description
printf "\033[1;92mDescription : \033[0m "
printf " This tool is made for automating task of finding the subdomain and\n\t\trelated information with the help of two tools subfinder and httpx"
printf "\n\n\033[1;92mUsage -->  \033[0mEnter th url name : example.com --> target_name.txt \033[1;92m(Check for results of crawl)\033[0m "

# reading the inputurl from user
printf "\n\n"
printf "\033[1;92mEnter the target IP/URL : [URL format --> example.com ] : \033[0m"
read target 

if [ -z "$target" ];  
then  
figlet -f mini "ERROR ! " 
printf "\e[31mNo target specified to perform the action :(\033[0m" 
else

# functional code
printf "\n\033[1;92m-------------- SubDCrawl --------------\033[0m\n\n"
printf "Target IP/URL : $target"

if ! command -v subfinder &> /dev/null
then
    echo "subfinder could not be found"
    exit
fi

if ! command -v httpx-toolkit  &> /dev/null
then
    echo "httpx-toolkit could not be found"
    exit
fi

subfinder -d $target | httpx-toolkit -title -sc >> $target.txt

echo "Completed ! All subdomain found ....."
printf "\n\033[0;32mResults are stored in -->  \033[0m$target.txt\n"

fi	

