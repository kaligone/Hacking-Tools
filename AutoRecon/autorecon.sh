#!/bin/bash

figlet -f Elite "AutoRecon" | lolcat 

echo
echo
echo

printf "\t\t\t\t\t\tCreated by : \033[1;91mKALIGONE\n"
printf "\t\t\t\t\t\tAll rights are reserved"

echo
echo
printf "\033[1;91mDISCLIAMER :  "
printf "\033[0mThis tool is made only for education purpose.\nCreater is not responsible for any kind of unethical use of tool"
printf "\033[0m\n\n"


printf "\033[1;92mDescription :"
printf "\033[0m"
echo "This is the tool made for automating the recon using NMAP"
echo "You can use severel nmap command to perform the recon as follows"
echo
echo "Recon Options :"
echo "-v : to increase the verbosity level of the scan"
echo "-A : to enable OS detection, version detection, script scanning and traceroute"
echo "-O :  to enable OS detection"
echo "-sV : to determine service/version of the open port"
echo "-sS : to activate TCP scan"
echo "-sU : to activate UDP scan"
echo "-p port_number  : to only scan particuler port number"
echo "-p- : to scan all 65535 ports"
echo
echo
 

echo "Enter the target IP/URL : "
read target

if [ -z "$target" ];  
then  
echo "ERROR ! No target specified to perform the recon :/"
else  
echo
echo "Enter the options for recon : (like -v -O -sS one by one)"
read op1 op2 op3 op4 op5 op6 op7 op8

printf "\n\033[1;92m-------------- AUTORECON --------------\033[0m\n\n"
printf "Recon target IP/URL : $target" >> rcon_result.txt

echo
echo "Recon started...."
echo "Running NMAP ...."

nmap $op1 $op2 $op3 $op4 $op5 $op6 $op7 $op8 $target >> rcon_result.txt

echo "Completed recon phase ....."
printf "\n\033[0;32mRecon results are stored in -->  \033[0mrcon_result.txt\n"

echo "Recon finished "

fi  
