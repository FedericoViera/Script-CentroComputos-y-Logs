echo
echo "Ingresa una palabra para buscar como referencia en los logs del sistema:"
echo
read palabra 
clear
echo "---------------------------------"
echo "----SCRIPT CENTRO DE COMPUTOS----"
echo "---------------------------------"
echo "Ingrese una opcion y pulse enter:"
echo "---------------------------------"
echo
cat /var/log/messages | grep $palabra
echo
echo "Pulse una tecla para continuar..."
read
