#!/bin/bash# digEm v 0.1# Author: kaotickj##########################################----------------- VARS ----------------########################################### $HOST = host# $IP = ip# $OUTPUT = output file############################################---------------) Colors (----------------############################################C=$(printf '\033')RED="${C}[1;31m"SED_RED="${C}[1;31m&${C}[0m"GREEN="${C}[1;32m"SED_GREEN="${C}[1;32m&${C}[0m"YELLOW="${C}[1;33m"SED_YELLOW="${C}[1;33m&${C}[0m"SED_RED_YELLOW="${C}[1;31;103m&${C}[0m"BLUE="${C}[1;34m"SED_BLUE="${C}[1;34m&${C}[0m"ITALIC_BLUE="${C}[1;34m${C}[3m"LIGHT_MAGENTA="${C}[1;95m"SED_LIGHT_MAGENTA="${C}[1;95m&${C}[0m"LIGHT_CYAN="${C}[1;96m"SED_LIGHT_CYAN="${C}[1;96m&${C}[0m"LG="${C}[1;37m" #LightGraySED_LG="${C}[1;37m&${C}[0m"DG="${C}[1;90m" #DarkGraySED_DG="${C}[1;90m&${C}[0m"NC="${C}[0m"UNDERLINED="${C}[5m"ITALIC="${C}[3m"################################################################################# Help                                                                         #################################################################################Help(){   # Display Help   echo ${RED}   echo "     _ _       _____           "   echo "  __| (_) __ _| ____|_ __ ___  "   echo " / _| | |/ _| |  _| | |_ | _ \ "   echo "| (_| | | (_| | |___| | | | | |"   echo " \__,_|_|\__, |_____|_| |_| |_|"   echo "         |___/                 "   echo    echo "${GREEN}By Kaotickj"   echo "${BLUE}Use this tools to simplify DNS Enumeration using dig."   echo   echo "Syntax: digEm.sh [-h|-H|-i|-o]"   echo "options:"   echo "${YELLOW}-h${BLUE} To show this message"   echo "${YELLOW}-H <HOSTNAME>${BLUE} To specify the target hostname"   echo "${YELLOW}-i <IP Address>${BLUE} To specify the target ip address."   echo "${YELLOW}-o <path/to/filename.ext>${BLUE} Specify the path and filename to save output to. If none, output will be save to digEm.txt in the current directory."   echo }################################################################################# Hack the Gibson################################################################################gibson(){    	clear	echo "INT. COMPUTER ROOM, ELLINGSON MINERAL."	echo "       The big monitor shows the attack in progress."	echo "       The main screen is filled with:"	echo	echo "             I WANT A COOKIE. GIVE ME A COOKIE NOW!"	echo "                                HAL"	echo "                    Theres a new virus in the database."	echo	echo "                                MARGO"	echo "                   Whats happening?"	echo	echo "                                HAL"	echo "                    Its replicating, eating up memory. What do I"	echo "                   do?"	echo	echo "                                PLAGUE"	echo "                    Type Cookie, you idiot. Ill head em off at"	echo "                    the pass."	echo	echo " ...   Another virus appears."	echo	echo "                                HAL"	echo "                    We have a Zero Bug attacking all the login and"	echo "                    overlay files."	echo	echo "                                PLAGUE"	echo "                    Run anti-virus. Give me a systems display!"	echo	echo "        The systems display comes up. Red flashes everywhere,"	echo "        signifying new attacks. Plague presses a key."	echo	echo "                                PLAGUE"	echo "                    Die, dickweeds!"	echo	echo "                                HAL"	echo "                    The rabbit is in the administration system."	echo	echo "        Rabbit icons start to fill the systems display."	echo	echo "                                PLAGUE"	echo "                    Send a Flu-shot."	echo	echo "                                MARGO"	echo "                    Rabbit, Flu-shot, someone talk to me."	echo	echo "                                HAL"	echo "                    A rabbit replicates till it overloads a file,"	echo "                    then it spreads like cancer."	echo	echo "                                MARGO"	echo "                    Cancer?"	echo -e "\e[31m[Owning Gibson / Please wait...\e[31m]"	echo -ne '#####                     (33%)\r'	sleep 3	echo -ne '#############             (66%)\r'	sleep 3	echo -ne '#######################   (100%)\r'	echo -ne '\n'	echo "Stager sent! Starting session.. ...."	echo "root@Gibson~#"}################################################################################################################################################################# Main program                                                                 #################################################################################################################################################################while getopts ":h?H:i:o:x?" opt; do  case "$opt" in       h) # display Help         Help         exit;;       H) HOST=${OPTARG};;       i) IP=${OPTARG};;       o) OUTPUT=${OPTARG};;       x) gibson          exit;;		     esacdoneecho "###############################" >> $OUTPUTecho "#          MX Records         #" >> $OUTPUT  echo "###############################" >> $OUTPUTdig mx $HOST @$IP >> $OUTPUTecho "###############################" >> $OUTPUTecho "#          TXT Records        #" >> $OUTPUT  echo "###############################" >> $OUTPUTdig txt $HOST @$IP >> $OUTPUTecho "###############################" >> $OUTPUTecho "#       CNAME Records         #" >> $OUTPUT  echo "###############################" >> $OUTPUTdig cname $HOST @$IP >> $OUTPUTecho "###############################" >> $OUTPUTecho "#          NS Records         #" >> $OUTPUT  echo "###############################" >> $OUTPUTdig ns $HOST @$IP >> $OUTPUTecho "###############################" >> $OUTPUTecho "#          A  Records         #" >> $OUTPUT  echo "###############################" >> $OUTPUTdig a $HOST @$IP >> $OUTPUTecho "###############################" >> $OUTPUTecho "#          AXFR Scan          #" >> $OUTPUT  echo "###############################" >> $OUTPUTdig axfr $HOST @$IP >> $OUTPUTecho "###############################" >> $OUTPUTecho "#           ANY Scan          #" >> $OUTPUT  echo "###############################" >> $OUTPUTdig any $HOST @$IP >> $OUTPUTecho "###############################" >> $OUTPUTecho "#           ALL Scan          #" >> $OUTPUT  echo "###############################" >> $OUTPUTdig all $HOST @$IP >> $OUTPUTcat $OUTPUTecho 'Output saved to ' $OUTPUT