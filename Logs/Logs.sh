seleccion=9

	while ! [ $seleccion -eq 0 ]
        do
	clear
        echo "---------------------------------"
        echo "----SCRIPT CENTRO DE COMPUTOS----"
	echo "---------------------------------"
	echo "Ingrese una opcion y pulse enter:"
	echo "---------------------------------"
        echo
        echo "Opcion 1: Inicios de sesion a partir de un usuario"
        echo "Opcion 2: Inicios de sesion fallidos"
	echo "Opcion 3: Todos los inicios de sesion"
	echo "Opcion 4: Inicios de sesion a través de SSHD"
	echo "Opcion 5: Logs demonios"
	echo "Opcion 6: Logs cron"
	echo "Opcion 7: Logs paquetes instalados"
	echo "Opcion 8: Logs del firewall"
        echo "Opcion 0: Volver"
	read modo
	echo
	
	case $modo in
	
	
		1) sh Logs/LoginsUsuario.sh;;
		
		2) sh Logs/LoginsFallidos.sh;;

		3) sh Logs/Logins.sh;;

		4) sh Logs/LoginsSSHD.sh;;

		5) sh Logs/LogsDemonios.sh;;

		6) sh Logs/LogsCron.sh;;

		7) sh Logs/LogsPaquetes.sh;;

		8) Logs/LogsFirewall.sh;;

		0) seleccion=0;;
		*) seleccion=9;;
	
		esac

	done	
