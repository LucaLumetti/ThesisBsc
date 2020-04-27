[ ! -d pdf ] && mkdir pdf
[ ! -f thesis.bib ] && echo "Manca il file thesis.bib"
[ ! -f thesis.tex ] && echo "Manca il file thesis.tex"
[ ! -f thesis-frn.tex] && echo "Manca il file thesis-frn.tex"

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
