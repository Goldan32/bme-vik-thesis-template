DOCUMENT=thesis
DOC_GUIDE=guide
#MODE=-interaction=batchmode

# Make sure to represent this in gitignore file
PDF_FOLDER := pdf

.PHONY: default all clean guide

default: xelatex

all: xelatex guide

$(PDF_FOLDER):
	mkdir -p $@

xelatex: compile_xelatex | $(PDF_FOLDER)
	mv $(DOCUMENT)-xelatex.pdf $(PDF_FOLDER)/$(DOCUMENT).pdf

compile_xelatex:
	xelatex $(MODE) $(DOCUMENT)
	bibtex $(DOCUMENT)
	xelatex $(MODE) $(DOCUMENT)
	xelatex $(MODE) $(DOCUMENT)
	mv $(DOCUMENT).pdf $(DOCUMENT)-xelatex.pdf

switch_to_hungarian:
	sed -i "s|^\\\input{include/thesis-en}|%\\\input{include/thesis-en}|" $(DOCUMENT).tex
	sed -i "s|^%\\\input{include/thesis-hu}|\\\input{include/thesis-hu}|" $(DOCUMENT).tex


switch_to_english:
	sed -i "s|^\\\input{include/thesis-hu}|%\\\input{include/thesis-hu}|" $(DOCUMENT).tex
	sed -i "s|^%\\\input{include/thesis-en}|\\\input{include/thesis-en}|" $(DOCUMENT).tex

guide: compile_guide | $(PDF_FOLDER)
	mv $(DOC_GUIDE).pdf $(PDF_FOLDER)/$(DOC_GUIDE).pdf

compile_guide:
	xelatex $(MODE) $(DOC_GUIDE)
	bibtex $(DOC_GUIDE)
	xelatex $(MODE) $(DOC_GUIDE)
	xelatex $(MODE) $(DOC_GUIDE)

clean:
	echo Cleaning temporary files...
	rm -rf *.aux */*.aux *.dvi *.thm *.lof *.log *.lot *.fls *.out *.toc *.bbl *.blg *.pdf
	rm -rf $(PDF_FOLDER)
