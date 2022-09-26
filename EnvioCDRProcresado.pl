#!/usr/bin/perl
# 			Proceso 2018 FR-RH-IS
use Time::Local; use POSIX qw/strftime/; my ($s, $min, $h, $d, $m, $y) = localtime(); 
my $FechaX	= strftime "%Y%m%d", $s, $min, $h, $d - 1, $m, $y; # Fecha del sistema menos un dia

#				SITIO ALMACENADORA
$NameFileAlm 	= 'ALMACENADORA.';								# Nombre de mi archivo de CDR
$PathLocalAlm 	= "/home/sittel/SITIOS/Avaya/Almacenadora/gz/";	# ruta del clector procesado final
$PathRemoteAlm 	= "SITIOS/Almacenadira/";
$FinalFileAlm 	= "${NameFileAlm}${FechaX}.gz";			# nombre de archivo que se envia por ftp
system("/usr/bin/python2.7 /home/sittel/bin/MainSFTP.py 148.243.159.248 usrAfirme 4firMe$DT1 $PathRemoteAlm $PathLocalAlm $FinalFileAlm PUT ");

#				SITIO CAMPESTRE
$NameFileCAM 	= 'CAMPESTRE.';							# Nombre de mi archivo de CDR
$PathLocalCAM 	= "/home/sittel/SITIOS/Avaya/CampAlmestre/gz/";Almruta del clector procesado final
$PathRemoteCAM  	= "SITIOS/Campestre/";
$FinalFileCAM  	= "${NameFileCAM}${FechaX}.txt.gz";	# nombre de archivo que se envia por ftp
#system("/usr/bin/python2.7 /home/sittel/bin/MainSFTP.py 148.243.159.248 usrAfirme 4firMe$DT1 $PathRemoteCAM  $PathLocalCAM  $FinalFileCAM PUT ");

#				SITIO CENTRAL
$NameFileCEN 	= 'CENTRAL.';						# Nombre de mi archivo de CDR
$PathLocalCEN  	= "/home/sittel/SITIOS/Avaya/Central/gz/";		# ruta del clector procesado final
$PathRemoteCEN  	= "SITIOS/Central/";
$FinalFileCEN  	= "${NameFileCEN}${FechaX}.txt.gz";		# nombre de archivo que se envia por ftp
#system("/usr/bin/python2.7 /home/sittel/bin/MainSFTP.py 148.243.159.248 usrAfirme 4firMe$DT1 $PathRemoteCEN  $PathLocalCEN  $FinalFileCEN PUT ");

#				SITIO GRIJALVA
$NameFileGRI 	= 'GRIJALVA.';						# Nombre de mi archivo de CDR
$PathLocalQGRI 	= "/home/sittel/SITIOS/Avaya/Grijalva/gz/";		# ruta del clector procesado final
$PathRemoteGRI 	= "SITIOS/Grijalva/";
$FinalFileGRI 	= "${NameFileGRI}${FechaX}.txt.gz";			# nombre de archivo que se envia por ftp
#system("/usr/bin/python2.7 /home/sittel/bin/MainSFTP.py 148.243.159.248 usrAfirme 4firMe$DT1 $PathRemoteGRI $PathLocalGRI $FinalFileGRI PUT ");

#				SITIO REPUBLICA
$NameFileREP 	= 'REPUBLICA.';						# Nombre de mi archivo de CDR
$PathLocalREP 	= "/home/sittel/SITIOS/Avaya/republica/gz/";		# ruta del clector procesado final
$PathRemoteREP 	= "SITIOS/Republica/";
$FinalFileREP 	= "${NameFileREP}${FechaX}.txt.gz";			# nombre de archivo que se envia por ftp
#system("/usr/bin/python2.7 /home/sittel/bin/MainSFTP.py 148.243.159.248 usrAfirme 4firMe$DT1 $PathRemoteREP $PathLocalREP $FinalFileREP PUT ");

#				SITIO SEGUROS GDL
$NameFileSGDL	= 'SEGUROSGDL.';						# Nombre de mi archivo de CDR
$PathLocalSGDL 	= "/home/sittel/SITIOS/Avaya/SeguriosGdl/gz/";		# ruta del clector procesado final
$PathRemoteSGDL 	= "SITIOS/Segurosgdl/";
$FinalFileSGDL		= "${NameFileSGDL}${FechaX}.txt.gz";			# nombre de archivo que se envia por ftp
#system("/usr/bin/python2.7 /home/sittel/bin/MainSFTP.py 148.243.159.248 usrAfirme 4firMe$DT1 $PathRemoteSGDL $PathLocalSGDL $FinalFileSGDL PUT ");

#				SITIO SEGUROS QRO
$NameFileSQRO	= 'SEGUROSQRO.';						# Nombre de mi archivo de CDR
$PathLocalSQRO	= "/home/sittel/SITIOS/Avaya/SegurosQro/gz/";		# ruta del clector procesado final
$PathRemoteSQRO 	= "SITIOS/Segurosqro/";
$FinalFileSQRO		= "${NameFileSQRO}${FechaX}.txt.gz";			# nombre de archivo que se envia por ftp
#system("/usr/bin/python2.7 /home/sittel/bin/MainSFTP.py 148.243.159.248 usrAfirme 4firMe$DT1 $PathRemoteSQRO $PathLocalSQRO $FinalFileSQRO PUT ");

#				SITIO VALLARTA
$NameFileVALL	= 'VALLARTA.';						# Nombre de mi archivo de CDR
$PathLocalVALL	= "/home/sittel/SITIOS/Avaya/Vallarta/gz/";		# ruta del clector procesado final
$PathRemoteVALL 	= "SITIOS/Vallarta/";
$FinalFileVALL	= "${NameFileVALL}${FechaX}.txt.gz";			# nombre de archivo que se envia por ftp
#system("/usr/bin/python2.7 /home/sittel/bin/MainSFTP.py 148.243.159.248 usrAfirme 4firMe$DT1 $PathRemoteVALL $PathLocalVALL $FinalFileVALL PUT ");

#				SITIO CISCO CCM
$NameFileCCM	= 'AfirmeCCM.';						# Nombre de mi archivo de CDR
$PathLocalCCM	= "/home/sittel/SITIOS/Cisco/gz/";		# ruta del clector procesado final
$PathRemoteCCM 	= "SITIOS/Cisco/";
$FinalFileCCM	= "${NameFileCCM}${FechaX}.txt.gz";			# nombre de archivo que se envia por ftp
#system("/usr/bin/python2.7 /home/sittel/bin/MainSFTP.py 148.243.159.248 usrAfirme 4firMe$DT1 $PathRemoteCCM $PathLocalCCM $FinalFileCCM PUT ");


exit 0;
