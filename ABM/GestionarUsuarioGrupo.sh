seleccion=9;
echo
echo "Ingresa un nombre de usuario al cual gestionar sus grupos:"
read usuario
usuario_existe=$(cat /etc/passwd | grep -c $usuario)
if ! [ $usuario_existe -eq 0 ]
then
     while ! [ $seleccion -eq 0 ]
     do
	grupos_usuario=$(id -Gn $usuario)
	
	clear
	echo "---------------------------------"
        echo "----SCRIPT CENTRO DE COMPUTOS----"
        echo "---------------------------------"
        echo "Ingrese una opcion y pulse enter:"
        echo "---------------------------------"
	echo 
	echo "Usuario encontrado:" $usuario
	echo "Grupos al los que pertenece:"
	echo
	tput setaf 1
	echo $grupos_usuario
	tput setaf 7
	echo 
	echo "Opcion 1: Asignar grupo"
	echo "Opcion 2: Desasignar grupo"
	echo "Opcion 0: Atras"
	read modo

	case $modo in

		1) echo
		   echo "Ingrese el nombre del grupo a asignarle al usuario:"
		   read grupo

		   grupo_existe=$(grep -c -w $grupo /etc/group)

		   if ! [ $grupo_existe -eq 0 ]
		   then
			gpasswd -a $usuario $grupo
		   else
			echo "El grupo ingresado no existe" 
		   	echo
			echo "Pulse una tecla para continuar..."
			read
		   fi
		   ;;

		2) echo
                   echo "Ingrese el nombre del grupo a desasignar del usuario:"
                   read grupo

                   grupo_existe=$(grep -c -w $grupo /etc/group)

                   if ! [ $grupo_existe -eq 0 ]
                   then
                        gpasswd -d $usuario $grupo
                   else
                        echo "El grupo ingresado no existe"
                        echo
                        echo "Pulse una tecla para continuar..."
                        read
                  
		   fi
                   ;;
		0) seleccion=0;;
		*) seleccion=9;;
	esac
   done
else
	echo
	echo "No existe un usuario registrado en el sistema con ese nombre"
	echo
	echo "Pulse una tecla para continuar..."
	read
fi
