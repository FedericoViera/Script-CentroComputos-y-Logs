#!bin/bash
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
	echo "Opcion 1: ABM usuarios y grupos"
	echo "Opcion 2: Gestion de respaldos"
	echo "Opcion 3: Configuracion de red"
	echo "Opcion 4: Opciones de seguridad"
	echo "Opcion 5: Logs"
	echo "Opcion 0: Salir"
	read seleccion

	case $seleccion in
	
		1) sh ABM/ABM.sh;;
		2) sh respaldos.sh;;
		3) sh Red/RED.sh;;
		4) seguridad.sh;;
		5) Logs/Logs.sh;;
		0) seleccion=0;;
		*) seleccion=9;;
	esac
done
