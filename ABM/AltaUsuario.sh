echo
echo "Ingresa el nombre para el usuario a agregar:"
read usuario
echo 

useradd $usuario -m -d /home/$usuario

echo "Configuracion de la nueva contraseña del usuario:"
echo
echo "Ingrese la contraseña para el usuario y pulse enter"
echo "Despues de ello, vuelva a ingresarla y pulse enter nuevamente"
echo
passwd $usuario 2>/dev/null
echo
echo "Contraseña actualizada correctamente, pulse enter para terminar"
read
