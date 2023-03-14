LATEX := xelatex
LATEX_ARGS := -synctex=1 -interaction=batchmode -halt-on-error -file-line-error -shell-escape
LATEXMK := latexmk
LATEXMK_ARGS := $(LATEX_ARGS) -xelatex
S := scripts
I := images
PDFS := \
	rfcircuits.pdf \
	signals.pdf
IMGTEXS := $(shell cd scripts && ls *.tex | xargs -n 1 | cut -f 1 -d '.')

%: %.tex notes.cls
	$(LATEXMK) $(LATEXMK_ARGS) $<

clean:
	$(LATEXMK) -c *.pdf
	rm -f *.pdf **/*.pdf
	rm -f *.{aux,fdb_latexmk,fls,log,synctex*,xdv,synctex.gz,synctex*,loep,qst}
	rm -f **/*.{aux,fdb_latexmk,fls,log,synctex*,xdv,synctex.gz,synctex*,loep,qst}
	rm -f $I/*

clean-scripts:
	rm -f $S/*.{aux,log,synctex.gz}

$I/%: $S/%.tex $S/notefig.cls
	cd $S && $(LATEX) $(LATEX_ARGS) $(<F) && mv $(@F).pdf ../$I && echo

pdfs: $(PDFS)

images: $(IMGS) $(foreach i,$(IMGTEXS),$I/$i)

all: $(IMGS) $(PDFS)
