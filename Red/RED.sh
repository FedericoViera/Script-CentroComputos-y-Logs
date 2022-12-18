seleccion=9
while ! [ $seleccion -eq 0 ]
do 
	estado_red=$(systemctl status network | grep -w Active | cut -d ":" -f2 | cut -d "(" -f1)
	if [ $estado_red = "active" ]
	then
		estado_red=Activo
	else
		estado_red=Inactivo
	fi
	
        clear
        echo "---------------------------------"
        echo "----SCRIPT CENTRO DE COMPUTOS----"
        echo "---------------------------------"
        echo "Ingrese una opcion y pulse enter:"
        echo "---------------------------------"
        echo
	echo "Servicio de Red:" $estado_red
        echo
	echo "Opcion 1: Acivar servicio de red"
        echo "Opcion 2: Desactivar servicio de red"
        echo "Opcion 3: Configuracion de red"
        echo "Opcion 0: Atras"
        read seleccion

        case $seleccion in

                1) systemctl start network;;
                2) systemctl stop network;;
                3) nmtui;;
		0) seleccion=0;;
                *) seleccion=9;;
        esac
done
