LATEX = pdflatex
#LATEX = latex
DVI2PDF = dvipdf
SPELL = aspell
TEX = paper
BIBTEX = bibtex
SOURCES = $(wildcard *.tex) $(wildcard *.bib)

default: pdf

pdf: $(SOURCES)
	$(LATEX) $(TEX); $(BIBTEX) $(TEX); $(LATEX) $(TEX); $(LATEX) $(TEX); 

view:
	$(LATEX) $(TEX)
	acroread $(TEX).pdf

osx:
	$(LATEX) $(TEX)
	open $(TEX).pdf

check:
	@echo "Passing the check will cause make to report Error 1."
	$(LATEX) $(TEX)  | grep -i undefined

clean:
	$(RM) -f *.aux *.blg *.dvi *.log *.toc *.lof *.lot *.cb *.bbl $(TEX).ps $(TEX).pdf *~
