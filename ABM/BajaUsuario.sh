echo
echo "Ingresa un nombre de usuario el cual eliminar"
read usuario
usuario_existe=$(cat /etc/passwd | grep -c $usuario)
if ! [ $usuario_existe -eq 0 ]
then
	echo 
	echo "Usuario encontrado: $usuario"
	echo 
	echo "Opcion 1: Eliminar usuario"
	echo "Opcion 2: Eliminar usuario junto a archivos pertenecientes a este"
	read modo

		if [ $modo -eq 1 ]
		then
			userdel $usuario
		else
			userdel -r $usuario
		fi

	echo "Usuario eliminador correctamente"
else
	echo
	echo "No existe un usuario registrado en el sistema con ese nombre"
fi
echo
echo "Pulse una tecla para continuar..."
read
