#!/bin/bash
fileN=thesis_pres
pdflatex $fileN.tex
pdflatex $fileN.tex
rm $fileN.aux
rm $fileN.log
rm $fileN.nav
rm $fileN.out
rm $fileN.snm
rm $fileN.toc