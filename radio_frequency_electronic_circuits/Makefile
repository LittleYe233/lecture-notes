LATEX := xelatex
LATEX_ARGS := -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape
LATEXMK := latexmk
LATEXMK_ARGS := $(LATEX_ARGS) -xelatex

notes.pdf: notes.tex notes.cls
	$(LATEXMK) $(LATEXMK_ARGS) notes.tex

clean:
	$(LATEXMK) -c *.pdf
	rm -f *.pdf *.synctex.gz

all: $(wildcard *.pdf)
