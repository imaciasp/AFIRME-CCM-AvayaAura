#!/usr/bin/perl 
# Name:
#	immstrip.pl
#
# Description:
#	This perl script takes a pbx imm output
#	and sends out all the CDR lines formated
#	to Saul's specifications. The default input
#	is yesterday's rawdata file located in
#	/apps/sittel/rawdata/harris.$YESTERDAY
#	The default output is the file located in
#	/apps/sittel/strip/bnrtglsa${YESTERDAY}24
#
# Synopis:
#	immstrip.pl [-f filename ] [-v]
#
# Author:
#	Felix Montes Kotze <fmontes@dti.com.mx>
#
# Revisions:
#	11/24/97: Initial version (fmontes)
#
# Bugs:
#	The script itself :-)
#
# Setup

$defaultInput  = '/home/sittel/SITIOS/Avaya/Central/rawdata/tmp1';
$defaultOutput = '/home/sittel/SITIOS/Avaya/Central/gz/CENTRAL.';

@arDate = localtime( time - 86400 );
@arTime = localtime( time - 3600 );

$arDateY = $arDate[5]+1900;
$arDateM =  (length ++$arDate[4] < 2 ? "0" : "" ) . $arDate[4];
$arDateD =  (length $arDate[3] < 2 ? "0" : "" ) . $arDate[3];

#while($arDateM>7) {
#{

$searchDate = join("", $arDateY, $arDateM, $arDateD);
#$searchDate = ("20220411");
$searchTime = (length $arTime[2] < 2 ? "0" : "" ) . $arTime[2];
$flagTime=0;


$verboseInput = "from $defaultInput.$searchDate";

# Main
&ParseArgs;
$searchStr = "$searchDate ";
$searchStr .= "$searchTime" if $flagTime;

if ($flagVerbose) {
	print STDERR "searching $verboseInput for CDRs...\n";
	print STDERR "Output is $verboseOutput.\n";
}

while (<STDIN>) {
	&Saulizate($_);
}

print STDERR "Lines:$flagLines  Matched:$flagMatch   \n\n" if $flagVerbose;
exit 0;

# Procedures

sub ParseArgs {
my($param);

	while ( $param = shift @ARGV ) {
		if ($param eq "-v") {
			$flagVerbose = 1;
		} elsif ($param eq "-f") {
			$inputOverride = 1;
			$inputFile = shift @ARGV;
			if (! -r $inputFile) {
				print "Error: Cannot read '$inputFile': $!\n";
				exit 1;
			} else {
				open(STDIN,"<$inputFile") || die "$!";
				$verboseInput = "file $inputFile";
				
			}
		} else {
			print "Error: Unexpected parameter '$param'\n";
			exit 1;
		}
	}

# Open default INPUT

	unless ($inputOverride) {
		$inputFile = "$defaultInput.$searchDate";
		if (! -r $inputFile) {
			print "Error: Cannot read '$inputFile': $!\n";
			exit 1;
		} else {
			open(STDIN,"<$inputFile") || die "$!";
			$verboseInput = "file $inputFile";
		}
	}

# Open default OUTPUT
	$outputFile = "$defaultOutput$searchDate";
	if ($inputOverride) {
		$inputFile =~ /.*\.(\d{6})/;
		$outputFile = $defaultOutput . $1 .$searchStrDate;
	}
	open(STDOUT,">$outputFile") || die "$outputFile: $!";
	$verboseOutput = "file $outputFile";
	
}


sub Saulizate {
my(@thing);

 
$flagLines++;
                if($_>97)
                {
		$flagMatch++;
		chop;
#              	 print join(',',unpack("a8a6a8a6a6xa4xa4xa1xa4xa4xa23xa15xa32xa1xa5xa3xa1xa4xa4",$_)),"\n";
#		 print join(',',unpack("a4xa4xa1xa3xa3xa15xa4xa24xa1xa8xa3xa1xa10", $_)),"\n";
                print join(',', unpack("a4xa4xa1xa3xa3xa15xa4x7a10xa7xa1xa4xa3xa3xa1xa10xa6", $_)),"\n";
#                print join(',', unpack("a6xa4xa4xaxa3xa3xa15xa4xa11xa5xaxa4xa3xa3xaxa10", $_)),"\n";
#("a4xa4xaxa3xa3xa15xa5xa5xa10xa9xaxaxa3xa3xa", $_)                
}
print STDERR "Lines:$flagLines  Matched:$flagMatch   \r" if $flagVerbose;
}
