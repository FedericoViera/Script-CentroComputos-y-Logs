seleccion=9
echo
echo "Ingresa un nombre de usuario el cual modificar"
read usuario
usuario_existe=$(cat /etc/passwd | grep -c -w $usuario)
echo
if ! [ $usuario_existe -eq 0 ]
then
	while ! [ $seleccion -eq 0 ]
        do
	directorio_actual=$(grep -w $usuario /etc/passwd | cut -d ":" -f6)
	shell_actual=$(grep -w $usuario /etc/passwd | cut -d ":" -f7)
	uid_actual=$(grep -w $usuario /etc/passwd | cut -d ":" -f3)
	esta_bloqueado=$(passwd -S $usuario | cut -d "(" -f2 | cut -d "," -f1)
	if ! [ "$esta_bloqueado" = "Contraseña establecida" ]
	then
		estado="Bloqueado"
	else
		estado="Desbloqueado"
	fi
	
	clear
        echo "---------------------------------"
        echo "----SCRIPT CENTRO DE COMPUTOS----"
	echo "---------------------------------"
	echo "Ingrese una opcion y pulse enter:"
	echo "---------------------------------"
        echo
        echo "Usuario encontrado:" $usuario
        echo "UID:" $uid_actual
        echo "Directorio de trabajo:" $directorio_actual
        echo "Shell:" $shell_actual
        echo "Estado:" $estado
	echo
        echo "Opcion 1: Modificar el nombre de usuario"
        echo "Opcion 2: Modificar el directorio de trabajo"
	echo "Opcion 3: Cambiar shell del usuario"
	echo "Opcion 4: Cambiar UID del usuario"
	echo "Opcion 5: Bloquear usuario"
	echo "Opcion 6: Desbloquear usuario"
	echo "Opcion 7: Cambiar contraseña"
        echo "Opcion 0: Volver"
	read modo
	echo
	
	case $modo in
	
	
		1) echo "Ingrese un nuevo de usuario:"
		   read nuevo_nombre
		   usermod -l $nuevo_nombre $usuario
		   usuario=$nuevo_nombre 
		   ;;
		
		2) echo "Ingresa el nuevo directorio de trabajo para el usuario:"
                   read directorio
		   usermod -d $directorio -m $usuario
		   ;;

		3) echo "Shells del sistema:"
		   echo
		   cat /etc/shells
		   echo
		   echo "Escribe la shell a configurar para el usuario:"
		   read shell
		   usermod -s $shell $usuario
		   ;;

		4) echo "Escribe el nuevo UID a configurar para el usuario:"
		   read id_usuario
		   usermod -u $id_usuario $usuario
		   ;;

		5) usermod -L $usuario;;
                6) usermod -U $usuario;;
                7) passwd $usuario;;		
		0) seleccion=0;;
		*) seleccion=9;;
		esac

	done	
else
	echo "Usuario no encontrado"
	echo
	echo "Pulse una tecla para volver volver al menu..."
	read
	fi
fi

