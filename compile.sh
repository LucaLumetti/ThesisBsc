#!/bin/bash
# compile frontpage, bib, mainfile and chapters
[ ! -d pdf ] && mkdir pdf
[ ! -f thesis.bib ] && echo "Manca il file thesis.bib" && exit 0

[ -f pdf/thesis-frn.tex ] && cp pdf/thesis-frn.tex thesis-frn.tex
[ -f pdf/thesis-frn.pdf ] && cp pdf/thesis-frn.pdf thesis-frn.pdf

[ ! -f thesis.tex ] && echo "Manca il file thesis.tex" && exit 0
[ ! -f thesis-frn.tex ] && echo "Manca il file thesis-frn.tex" && exit 0

cp thesis.bib pdf/thesis.bib
bibtex pdf/thesis > /dev/null 2>&1

pdflatex -output-directory=pdf thesis.tex > /dev/null 2>&1
cp pdf/thesis.pdf thesis.pdf

bibtex pdf/thesis > /dev/null 2>&1

pdflatex -output-directory=pdf thesis-frn.tex > /dev/null 2>&1
cp pdf/thesis-frn.pdf thesis-frn.pdf
cp pdf/thesis.pdf thesis.pdf

bibtex pdf/thesis > /dev/null 2>&1

pdflatex -output-directory=pdf thesis.tex > /dev/null 2>&1
cp pdf/thesis-frn.pdf thesis-frn.pdf
cp pdf/thesis.pdf thesis.pdf

echo "BIBTEXT\n"
bibtex pdf/thesis

echo "\nPDFLATEX\n"
pdflatex -output-directory=pdf thesis.tex
cp pdf/thesis-frn.pdf thesis-frn.pdf
cp pdf/thesis.pdf thesis.pdf
