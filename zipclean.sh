#!/bin/bash
#
# (C) Copyright by Svante Geisshirt <https://github.com/svante2001/>
# Released under GNU General Public License v3

zipfile=$1

tmpfile=$(mktemp /tmp/$0.XXXXXX)
for i in .vscode .DS_Store bin obj dll json; do
	zipinfo $zipfile | grep $i | awk '{print $9}' >> $tmpfile
done

cat $tmpfile | while read line; do
	zip -d $zipfile $line
done

rm -f $tmpfile