#!/bin/bash

function infile(){
  if [[ ! $1 ]] || [[ ! $2 ]]; then
     echo -e "\n[!] Uso infile <ruta> <contenido>\n" 
   else
     echo -e "\n[+] Buscando el contenido de archivo en: ${1}"; tput civis
     files=$((grep -r "${2}" $1 | grep -v "infile" | cut -d ":" -f1) 2>/dev/null)

     if [[ $files ]]; then 
        clear
        echo -e "\n[+] Coincidencias en archivos \n"
        echo -e "$files" | sort | uniq | while read -r line; do echo -e "\n\t${line}"; done
        tput cnorm
     else
       clear
       echo -e "\n[!] No se encontraron archivos\n" &>2; tput cnorm
    fi
 fi
}
