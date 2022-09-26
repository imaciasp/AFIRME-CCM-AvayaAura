#!/usr/bin/perl                                        

use Time::Local; use POSIX qw/strftime/; my ($s, $min, $h, $d, $m, $y) = localtime();
my $FechaX      = strftime "%Y%m%d", $s, $min, $h, $d, $m, $y;

$PathLocal1 	= "/home/sittel/SITIOS/Cisco/rawdata/";
$PathLocal2 	= "/home/sittel/SITIOS/Cisco/monitoreo/";
$NameFile1 	= 'cdr_StandAloneCluster_*_';
$NameFile2 	= "AfirmeMonitoreo.";
$FinalFile1	= "${NameFile1}${FechaX}*";
$FinalFile2 	= "${NameFile2}${FechaX}.txt";
$PathRemote	= "SITIOS/Cisco/monitoreo/";

system("cat $PathLocal1$FinalFile1 > $PathLocal2$FinalFile2");
system("gzip $PathLocal2$FinalFile2");
system("/home/sittel/bin/sndsftp 148.243.159.248 sittel sittel k3yt1azeus $FinalFile2.gz $PathLocal2 $FinalFile2.gz $PathRemote");
#system("/home/sittel/bin/sndsftp datakeytia.dti.com.mx sittel sittel NoFuming $FinalFile2.gz $PathLocal2 $FinalFile2.gz $PathRemote");
system("rm ${PathLocal2}${FinalFile2}.gz");
