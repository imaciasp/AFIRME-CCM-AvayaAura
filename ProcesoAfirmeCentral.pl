#!/usr/bin/perl                                        

use Time::Local; use POSIX qw/strftime/; my ($s, $min, $h, $d, $m, $y) = localtime();
my $FechaX      = strftime "%Y%m%d", $s, $min, $h, $d - 1, $m, $y;
#my $FechaX 	= "20220427";

$PathBin 	= "/home/sittel/bin/";
$PathLocal1 	= "/home/sittel/SITIOS/Avaya/Central/rawdata/";
$PathLocal2 	= "/home/sittel/SITIOS/Avaya/Central/gz/";
$PathLocal3	= "/home/sittel/SITIOS/Avaya/Central/gzraw/";
$NameFile1 	= "depNortel.pl";
$NameFile2	= "Central";
$NameFile3	= "tmp1.";
$NameFile4 	= "immstripbl2AFIRME.pl";
$NameFile5 	= "CENTRAL.";
$PathRemote 	= "SITIOS/Central/";
$FinalFile1	= "${NameFile2}${FechaX}.CSV";
$FinalFile2	= "$NameFile3$FechaX";
$FinalFile3	= "$NameFile5$FechaX";

system("$PathBin$NameFile1 $PathLocal1$FinalFile1 > $PathLocal1$FinalFile2");
system("$PathBin$NameFile4");
system("gzip $PathLocal2$FinalFile3");
system("rm $PathLocal1$FinalFile2");
system("gzip $PathLocal1$FinalFile1");
system("mv ${PathLocal1}${FinalFile1}.gz ${PathLocal3}${FinalFile1}.gz");
system("/home/sittel/bin/sndsftp 148.243.159.248 sittel sittel k3yt1azeus $FinalFile3.gz $PathLocal2 $FinalFile3.gz $PathRemote");
