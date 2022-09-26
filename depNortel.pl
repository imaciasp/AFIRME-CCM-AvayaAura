#!/usr/bin/perl
#
# Script para quitar los caracteres extranios
# de un archivo CDR SINERCORP
# 
# Conmutador:
#	Nortel
#
# Cliente:
#	Banorte 
# 
# Revision:
#	0.1
# Usage:
#      depNortel.pl <inputfile>
# Salida:
#	STDOUT
#

# Define caracteres a eliminar
my $basura="|| ";

while (<>) {

# print;  s///g; s/|
  s/$basura//g;
  s/(\W)2004\d{8}//g;
  print;
}
