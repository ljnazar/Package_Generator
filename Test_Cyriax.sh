#!/bin/bash
# -- UTF 8 --

function _menuPrincipal() 
{ 
	clear
	echo "----------------------------------"
	echo "--> Script para probar Cyriax! <--"
	echo "----------------------------------"
	echo 
	echo "1) Paquete ICMP"
	echo "2) Paquete TCP"
	echo "3) Paquete UDP"
	echo 
	echo "4) Salir" 
	echo 
	echo -n "Indica una opcion: " 
}

function _submenu1() 
{ 
	clear
	echo "-- Paquete ICMP --" 
	echo
	echo "Mensajes que generan respuesta:"
	echo
	echo "1) echo-request"
	echo "2) timestamp-request"
	echo
	echo "Mensajes de redirección:"
	echo
	echo "3) redirect-network" 
	echo "4) redirect-host"
	echo "5) redirect-tos and network"
	echo "6) redirect-tos and host"
	echo
	echo "7) Volver" 
	echo 
	echo -n "Indica una opcion: " 
} 

function _submenu2() 
{
	clear
	echo "-- Paquete TCP --" 
	echo 
	echo "1) Paquete con el flag SYN activado"
	echo "2) Paquete con el flag ACK activado"
	echo "3) Paquete con el flag FIN activado"
	echo "4) Paquete con el flag RST activado"
	echo "5) Paquete con los flags SYN y ACK activados"
	echo "6) Paquete con los flags FIN y ACK activados"
	echo
	echo "Flags inválidos:"
	echo 
	echo "7) Paquete con los flags FIN, URG y PSH activados (XMAS -> Christmas)"
	echo "8) Paquete con ningún flag activo (Null flags scan)"
	echo "9) Paquete con todos los flags activos"
	echo
	echo "10) Indicar los flags activos"
	echo
	echo "11) Volver" 
	echo 
	echo -n "Indica una opcion: " 
}

opc=0 
until [ $opc -eq 4 ] 
do 
	case $opc in 
		1)
			opc1=0 
			until [ $opc1 -eq 7 ] 
			do 
				case $opc1 in
					1) 
					clear
					echo "-- Mensaje ICMP echo-request --"
					echo
					echo -n "Nro Paquetes: "
					read n1
					echo
					echo -n "IP Destino: "
					read d1
					echo
					echo "Nivel [paquetes/segundo]"
					echo "Fast= 10 pkt/s"
					echo "Faster= 100 pkt/s"
					echo "Flood= Lo mas rápido posible"	 			
					echo
					echo -n "Seleccione modo [ --fast | --faster | --flood ]: "
					read f1
					echo "-----------------------------"
					echo
					echo "hping3 -c $n1 $d1 $f1 -1 -C 8"
					echo
					hping3 -c $n1 $d1 $f1 -1 -C 8
					;; 
					2) 
					clear
					echo "-- Mensaje ICMP timestamp-request --"
					echo
					echo -n "Nro Paquetes: "
					read n2
					echo
					echo -n "IP Destino: "
					read d2
					echo
					echo "Nivel [paquetes/segundo]"
					echo "Fast= 10 pkt/s"
					echo "Faster= 100 pkt/s"
					echo "Flood= Lo mas rápido posible"	 			
					echo
					echo -n "Seleccione modo [ --fast | --faster | --flood ]: "
					read f2
					echo "-----------------------------"
					echo
					echo "hping3 -c $n2 $d2 $f2 -1 -C 13"
					echo
					hping3 -c $n2 $d2 $f2 -1 -C 13
					;; 
					3) 
					clear
					echo "-- ICMP redirect-network --"
					echo
					echo -n "Nro Paquetes: "
					read n3
					echo
					echo -n "IP Destino: "
					read d3
					echo "-----------------------------"
					echo
					echo "hping3 -c $n3 $d3 -1 -C 5 -K 0"
					echo
					hping3 -c $n3 $d3 -1 -C 5 -K 0
					;; 
					4)
					clear
					echo "-- ICMP redirect-host --"
					echo
					echo -n "Nro Paquetes: "
					read n4
					echo
					echo -n "IP Destino: "
					read d4
					echo "-----------------------------"
					echo
					echo "hping3 -c $n4 $d4 -1 -C 5 -K 1"
					echo
					hping3 -c $n4 $d4 -1 -C 5 -K 1 
					;;
					5)
					clear
					echo "-- ICMP redirect-tos and network --"
					echo
					echo -n "Nro Paquetes: "
					read n5
					echo
					echo -n "IP Destino: "
					read d5
					echo "-----------------------------"
					echo
					echo "hping3 -c $n5 $d5 -1 -C 5 -K 2"
					echo
					hping3 -c $n5 $d5 -1 -C 5 -K 2 
					;;
					6)
					clear
					echo "-- ICMP redirect-tos and host --"
					echo
					echo -n "Nro Paquetes: "
					read n6
					echo
					echo -n "IP Destino: "
					read d6
					echo "-----------------------------"
					echo
					echo "hping3 -c $n6 $d6 -1 -C 5 -K 2"
					echo
					hping3 -c $n6 $d6 -1 -C 5 -K 2 
					;;
					*) 
					_submenu1 
					;; 
				esac 
				read opc1 
			done 
			_menuPrincipal 
			;; 
		2) 
			opc2=0 
			until [ $opc2 -eq 11 ] 
			do 
				case $opc2 in 
					1) 
					clear
					echo "-- TCP - Paquete con el flag SYN activado --" 
					echo
					echo -n "Nro Paquetes: "
					read n1
					echo
					echo -n "IP Destino: "
					read d1
					echo
					echo "Nivel [paquetes/segundo]"
					echo "Fast= 10 pkt/s"
					echo "Faster= 100 pkt/s"
					echo "Flood= Lo mas rápido posible"	 			
					echo
					echo -n "Seleccione modo [ --fast | --faster | --flood ]: "
					read f1
					echo
					echo -n "Seleccione puerto: "
					read p1

					echo "-----------------------------"
					echo
					echo "hping3 -c $n1 -S -p $p1 $f1 $d1"
					echo
					hping3 -c $n1 -S -p $p1 $f1 $d1
					;; 
					2) 
					clear
					echo "-- TCP - Paquete con el flag ACK activado --" 
					echo
					echo -n "Nro Paquetes: "
					read n2
					echo
					echo -n "IP Destino: "
					read d2
					echo
					echo "Nivel [paquetes/segundo]"
					echo "Fast= 10 pkt/s"
					echo "Faster= 100 pkt/s"
					echo "Flood= Lo mas rápido posible"	 			
					echo
					echo -n "Seleccione modo [ --fast | --faster | --flood ]: "
					read f2
					echo
					echo -n "Seleccione puerto: "
					read p2

					echo "-----------------------------"
					echo
					echo "hping3 -c $n2 -A -p $p2 $f2 $d2"
					echo
					hping3 -c $n2 -A -p $p2 $f2 $d2
					;; 
					3) 
					clear
					echo "-- TCP - Paquete con el flag FIN activado --" 
					echo
					echo -n "Nro Paquetes: "
					read n2
					echo
					echo -n "IP Destino: "
					read d2
					echo
					echo "Nivel [paquetes/segundo]"
					echo "Fast= 10 pkt/s"
					echo "Faster= 100 pkt/s"
					echo "Flood= Lo mas rápido posible"	 			
					echo
					echo -n "Seleccione modo [ --fast | --faster | --flood ]: "
					read f2
					echo
					echo -n "Seleccione puerto: "
					read p2

					echo "-----------------------------"
					echo
					echo "hping3 -c $n2 -F -p $p2 $f2 $d2"
					echo
					hping3 -c $n2 -F -p $p2 $f2 $d2
					;; 
					4) 
					clear
					echo "-- TCP - Paquete con el flag RST activado --" 
					echo
					echo -n "Nro Paquetes: "
					read n2
					echo
					echo -n "IP Destino: "
					read d2
					echo
					echo "Nivel [paquetes/segundo]"
					echo "Fast= 10 pkt/s"
					echo "Faster= 100 pkt/s"
					echo "Flood= Lo mas rápido posible"	 			
					echo
					echo -n "Seleccione modo [ --fast | --faster | --flood ]: "
					read f2
					echo
					echo -n "Seleccione puerto: "
					read p2

					echo "-----------------------------"
					echo
					echo "hping3 -c $n2 -R -p $p2 $f2 $d2"
					echo
					hping3 -c $n2 -R -p $p2 $f2 $d2
					;; 
					5) 
					clear
					echo "-- TCP - Paquete con los flags SYN y ACK activados --" 
					echo
					echo -n "Nro Paquetes: "
					read n3
					echo
					echo -n "IP Destino: "
					read d3
					echo
					echo "Nivel [paquetes/segundo]"
					echo "Fast= 10 pkt/s"
					echo "Faster= 100 pkt/s"
					echo "Flood= Lo mas rápido posible"	 			
					echo
					echo -n "Seleccione modo [ --fast | --faster | --flood ]: "
					read f3
					echo
					echo -n "Seleccione puerto: "
					read p3

					echo "-----------------------------"
					echo
					echo "hping3 -c $n3 -S -A -p $p3 $f3 $d3"
					echo
					hping3 -c $n3 -S -A -p $p3 $f3 $d3
					;;
					6) 
					clear
					echo "-- TCP - Paquete con los flags FIN y ACK activados --" 
					echo
					echo -n "Nro Paquetes: "
					read n3
					echo
					echo -n "IP Destino: "
					read d3
					echo
					echo "Nivel [paquetes/segundo]"
					echo "Fast= 10 pkt/s"
					echo "Faster= 100 pkt/s"
					echo "Flood= Lo mas rápido posible"	 			
					echo
					echo -n "Seleccione modo [ --fast | --faster | --flood ]: "
					read f3
					echo
					echo -n "Seleccione puerto: "
					read p3

					echo "-----------------------------"
					echo
					echo "hping3 -c $n3 -F -A -p $p3 $f3 $d3"
					echo
					hping3 -c $n3 -F -A -p $p3 $f3 $d3
					;;
					7)
					clear
					echo "-- TCP - Paquete con los flags FIN, URG y PSH activados (XMAS -> Christmas) --" 
					echo
					echo -n "Nro Paquetes: "
					read n5
					echo
					echo -n "IP Destino: "
					read d5
					echo
					echo "Nivel [paquetes/segundo]"
					echo "Fast= 10 pkt/s"
					echo "Faster= 100 pkt/s"
					echo "Flood= Lo mas rápido posible"	 			
					echo
					echo -n "Seleccione modo [ --fast | --faster | --flood ]: "
					read f5
					echo
					echo -n "Seleccione puerto: "
					read p5

					echo "-----------------------------"
					echo
					echo "hping3 -c $n5 -F -U -P -p $p5 $f5 $d5"
					echo
					hping3 -c $n5 -F -U -P -p $p5 $f5 $d5
					;;
					8)
					clear
					echo "-- TCP - Paquete con ningún flag activo (Null flags scan) --" 
					echo
					echo -n "Nro Paquetes: "
					read n6
					echo
					echo -n "IP Destino: "
					read d6
					echo
					echo "Nivel [paquetes/segundo]"
					echo "Fast= 10 pkt/s"
					echo "Faster= 100 pkt/s"
					echo "Flood= Lo mas rápido posible"	 			
					echo
					echo -n "Seleccione modo [ --fast | --faster | --flood ]: "
					read f6
					echo
					echo -n "Seleccione puerto: "
					read p6

					echo "-----------------------------"
					echo
					echo "hping3 -c $n6 -Y -p $p6 $f6 $d6"
					echo
					hping3 -c $n6 -Y -p $p6 $f6 $d6
					;;
					9)
					clear
					echo "-- TCP - Paquete con todos los flags activos --" 
					echo
					echo -n "Nro Paquetes: "
					read n7
					echo
					echo -n "IP Destino: "
					read d7
					echo
					echo "Nivel [paquetes/segundo]"
					echo "Fast= 10 pkt/s"
					echo "Faster= 100 pkt/s"
					echo "Flood= Lo mas rápido posible"	 			
					echo
					echo -n "Seleccione modo [ --fast | --faster | --flood ]: "
					read f7
					echo
					echo -n "Seleccione puerto: "
					read p7

					echo "-----------------------------"
					echo
					echo "hping3 -c $n7 -S -A -R -F -U -P -p $p7 $f7 $d7"
					echo
					hping3 -c $n7 -S -A -R -F -U -P -p $p7 $f7 $d7
					;;
					10)
					clear
					echo "-- TCP - Indicar los flags activos --" 
					echo
					echo -n "Nro Paquetes: "
					read n8
					echo
					echo -n "IP Destino: "
					read d8
					echo
					echo "Nivel [paquetes/segundo]"
					echo "Fast= 10 pkt/s"
					echo "Faster= 100 pkt/s"
					echo "Flood= Lo mas rápido posible"	 			
					echo
					echo -n "Seleccione modo [ --fast | --faster | --flood ]: "
					read f8
					echo
					echo -n "Seleccione puerto: "
					read p8
					echo
					echo -n "Seleccione los flags [ SYN= -S | ACK= -A | FIN= -F | RST= -R | PUSH= -P | URG= -U ]: "
					read t8
					echo "-----------------------------"
					echo
					echo "hping3 -c $n8 $t8 -p $p8 $f8 $d8"
					echo
					hping3 -c $n8 $t8 -p $p8 $f8 $d8
					;;  
					*) 
					_submenu2 
					;; 
				esac 
				read opc2 
			done 
			_menuPrincipal 
			;; 
		3)
			clear
			echo "-- Paquete UDP --" 
			echo
			echo -n "Nro Paquetes: "
			read n3
			echo
			echo -n "IP Destino: "
			read d3
			echo
			echo "Nivel [paquetes/segundo]"
			echo "Fast= 10 pkt/s"
			echo "Faster= 100 pkt/s"
			echo "Flood= Lo mas rápido posible"
			echo
			echo -n "Seleccione modo [ --fast | --faster | --flood ]: "
			read f3
			echo
			echo -n "Seleccione puerto: "
			read p3
			echo "-----------------------------"
			echo
			echo "hping3 -c $n3 -2 -p $p3 $f3 $d3"
			echo
			hping3 -c $n3 -2 -p $p3 $f3 $d3
			;;
		*) 
			_menuPrincipal 
			;; 
		esac 
		read opc 
done
clear




