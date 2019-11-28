#!/bin/sh

file=$1
objfile=`echo $file | sed 's/\.[^\.]*$//'`

g++ -g -o $objfile $file
$objfile
