LATEX := xelatex
LATEX_ARGS := -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape
LATEXMK := latexmk
LATEXMK_ARGS := $(LATEX_ARGS) -xelatex

rfcircuits.pdf: rfcircuits.tex notes.cls
	$(LATEXMK) $(LATEXMK_ARGS) rfcircuits.tex

clean:
	rm *.synctex.gz *.loep *.qst
	$(LATEXMK) -c *.pdf
	rm -f *.pdf

all: $(wildcard *.pdf)
