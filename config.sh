#!/bin/bash
# Script de configuracion basica con atajos y programas

#Detectar si esta abierto con root
if [ "$EUID" != 0 ];then 
	echo "Hay que usar root"
# Como tengo permisos ejecutar script	
	else 
		# actualizar programas instalados
		apt-get update -y
		# instalar aplicaciones
		apt install terminator neovim -y
		# añadir alias a .bashrc
		echo -e "\n ================ALIAS================\n ..='cd ..' \n la='ls -a --color=auto' \n ll='ls -l --color=auto' \n lla='ls -la --color=auto' \n install='sudo apt install --color=auto' \n update='sudo apt update' \n upgrade='sudo apt upgrade \n v='nvim' \n c='cat'\n " >> /home/$SUDO_USER/.bashrc 
		echo "\n================Alias de $SUDO_USER copiados================\n "
		# añadir alias a .bashrc de root
		echo -e "\n ================ALIAS================\n ..='cd ..' \n la='ls -a --color=auto' \n ll='ls -l --color=auto' \n lla='ls -la --color=auto' \n install='sudo apt install --color=auto' \n update='sudo apt update' \n upgrade='sudo apt upgrade \n v='nvim' \n c='cat'\n s='sudo' \n" >> /root/.bashrc 
		echo "\n================Alias de Root copiados================\n "
		# añadir configuracion nvim (~/.config/nvim/init.vim)
		# detectar si existe el directorio y fichero config
if [ -d /home/$SUDO_USER/.config/nvim ];then 
	#Si existe cambia el nombre y mueve el archivo a su ruta
	mv /home/$SUDO_USER/.config/nvim/init.vim /home/$SUDO_USER/.config/nvim/init.vim_copia
	mv ./init.vim /home/$SUDO_USER/.config/nvim/init.vim
else
	#Si no existe crea el directoprio y mueve el archivo
	mkdir -p /home/$SUDO_USER/.config/nvim 
	mv ./init.vim /home/$SUDO_USER/.config/nvim/init.vim
fi
fi
