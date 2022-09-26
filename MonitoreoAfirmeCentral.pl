#!/usr/bin/perl                                        

use Time::Local; use POSIX qw/strftime/; my ($s, $min, $h, $d, $m, $y) = localtime();
my $FechaX      = strftime "%Y%m%d", $s, $min, $h, $d, $m, $y;

$PathLocal1 	= "/home/sittel/SITIOS/Avaya/Central/rawdata/";
$PathLocal2 	= "/home/sittel/SITIOS/Avaya/Central/monitoreo/";
$NameFile1 	= "Central";
$FinalFile1 	= "${NameFile1}${FechaX}.CSV";
$PathRemote 	= "SITIOS/Central/monitoreo/";

system("cp $PathLocal1$FinalFile1 $PathLocal2$FinalFile1");
system("gzip $PathLocal2$FinalFile1");
system("/home/sittel/bin/sndsftp 148.243.159.248 sittel sittel k3yt1azeus $FinalFile1.gz $PathLocal2 $FinalFile1.gz $PathRemote");
system("rm ${PathLocal2}${FinalFile1}.gz");

exit 0;
