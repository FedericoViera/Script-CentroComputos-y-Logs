echo
echo "Ingresa el nombre para el grupo a crear:"
read grupo
 
grupo_existe=$(grep -c -w $grupo /etc/group)
if [ $grupo_existe -eq 0 ]
then
	groupadd $grupo
	id_grupo=$(grep -w $grupo /etc/group | cut -d ":" -f3)
	echo
	echo "Grupo creado con id:" $id_grupo
else
	echo "Ya existe un grupo con ese nombre ingresado"
fi
echo
echo "Presione una tecla para continuar..."
read

