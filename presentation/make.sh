#!/bin/bash
fileN=thesis_pres
pdflatex $fileN.tex
bibtex $fileN
pdflatex $fileN.tex
pdflatex $fileN.tex
rm *.aux
rm *.log
rm *.nav
rm *.out
rm *.snm
rm *.toc
