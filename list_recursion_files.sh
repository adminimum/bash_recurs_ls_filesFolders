#!/usr/bin/env bash


function ls_func {	
list=`ls -d $1/*`
for el in $list
do
	if [ -d $el ]
	then
		echo "D-----" $el
		ls_func $el
	else
		outp=`ls -la $el`
		path=`echo $outp | cut -d' ' -f9`
		rul=`echo $outp | cut -d' ' -f1`
		size=`du -h $el | cut -f1`
		echo $size ' ' $rul ' ' $path 
	fi
done
}

if [ -d $1 ]
then
	ls_func $1
fi
