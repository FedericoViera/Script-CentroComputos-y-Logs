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
	echo "Opcion 1: Alta de usuario"
	echo "Opcion 2: Baja de usuario"
	echo "Opcion 3: Modificacion de usuario"
	echo "Opcion 4: Listado de los usuarios del sistema"
	echo "Opcion 5: Alta de grupo"
	echo "Opcion 6: Baja de grupo"
	echo "Opcion 7: Gestionar grupo de un usuario"
	echo "Opcion 8: Listar grupos"
	echo "Opcion 0: Atras"
	read seleccion

	case $seleccion in
	
		1) sh ABM/AltaUsuario.sh;;
       		2) sh ABM/BajaUsuario.sh;;
        	3) sh ABM/ModificarUsuario.sh;;
		4) sh ABM/ListarUsuario.sh;;
		5) sh ABM/AltaGrupo.sh;;
		6) sh ABM/BajaGrupo.sh;;
		7) sh ABM/GestionarUsuarioGrupo.sh;;
		8) sh ABM/ListarGrupo.sh;;
		0) seleccion=0;;
        	*) seleccion=9;;
	esac
done
