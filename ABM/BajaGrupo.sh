echo
echo "Ingresa un nombre de grupo el cual eliminar"
read grupo
grupo_existe=$(grep -c -w $grupo /etc/group)
if ! [ $grupo_existe -eq 0 ]
then
	echo 
	echo "Grupo encontrado:" $grupo
	echo 
	echo "Opcion 1: Aceptar y eliminar"
	echo "Opcion 0: Cancelar y volver atras"
	read modo

		if [ $modo -eq 1 ]
		then
			groupdel $grupo
		echo
		echo "Grupo eliminado correctamente"
		fi
else
	echo
	echo "No existe un grupo registrado en el sistema con ese nombre"
fi
echo
echo "Pulse una tecla para continuar..."
read
