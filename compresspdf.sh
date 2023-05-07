#!/usr/bin/sh
# script to compress pdf files using ghostscript
# Created on 06/05/2023

filename="$1"
ls -ll $filename
echo "Input file = $filename"
unalias gs && echo "Unaliased gs" || "no alias set for gs"
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$filename.compressed.pdf" "$filename" && echo "File Compressed successfully" || echo "Error in compressing"
mv -v -- "$filename" "${filename%.*}_compressed.pdf"

