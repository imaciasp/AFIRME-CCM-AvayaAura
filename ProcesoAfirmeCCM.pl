#!/usr/bin/perl                                        

use Time::Local; use POSIX qw/strftime/; my ($s, $min, $h, $d, $m, $y) = localtime();

for (my $c =1; $c <=1; $c ++){
	my $f   = $c -1;
	my $FechaX      = strftime "%Y%m%d", $s, $min, $h, $d - 1, $m, $y;
	my $FechaT      = strftime "%Y%m%d", $s, $min, $h, $d - $f, $m, $y;

	$PathLocal1 	= "/home/sittel/SITIOS/Cisco/rawdata/";
	$PathLocal2 	= "/home/sittel/SITIOS/Cisco/gz/";
	$NameFile1 	= 'cdr_StandAloneCluster_*_';
	$NameFile2 	= "AfirmeCCM.";
	$FinalFile1	= "${NameFile1}${FechaX}";
	$FinalFile2 	= "${NameFile2}${FechaX}.txt";
	$FinalFile3	= "${NameFile1}${FechaT}";
	$PathRemote	= "SITIOS/Cisco/";

	# Concatena CDR
    	for (my $c1 =6; $c1 <=9; $c1 ++){
        	system("cat ${PathLocal1}${FinalFile1}0${c1}* > $PathLocal2$FinalFile2");
    	}
    	for (my $c2 =10; $c2 <=23; $c2 ++){
        	system("cat ${PathLocal1}${FinalFile1}${c2}* >> $PathLocal2$FinalFile2");
    	}
    	for (my $c3 =0; $c3 <=5; $c3 ++){
        	system("cat ${PathLocal1}${FinalFile4}0${c3}* >> $PathLocal2$FinalFile2");
    	}

	system("gzip $PathLocal2$FinalFile2");
	system("/home/sittel/bin/sndsftp 148.243.159.248 sittel sittel k3yt1azeus $FinalFile2.gz $PathLocal2 $FinalFile2.gz $PathRemote");
}
