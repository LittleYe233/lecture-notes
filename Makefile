LATEX := xelatex
LATEX_ARGS := -synctex=1 -interaction=batchmode -halt-on-error -file-line-error -shell-escape
LATEXMK := latexmk
LATEXMK_ARGS := $(LATEX_ARGS) -xelatex
S := scripts
I := images
PDFS := \
	rfcircuits.pdf \
	signals.pdf
IMGS := \
	signals.exponentially_decaying_sinusoidal_signal \
	signals.sampling_signal
IMGTEXS := $(shell cd scripts && ls *.tex | xargs -n 1 | cut -f 1 -d '.')

%: %.tex notes.cls
	$(LATEXMK) $(LATEXMK_ARGS) $<

clean:
	rm *.synctex.gz *.loep *.qst
	$(LATEXMK) -c *.pdf
	rm -f *.pdf **/*.pdf
	rm -rf $I/*
	rm -f $S/*.{aux,fdb_latexmk,fls,log,synctex*,xdv}
	rm -f **/*.aux
	rm -rf $S/**/__pycache__ $S/__pycache__

rfcircuits.%: $S/rfcircuits/%.py $S/generate_pgf.py
	python -m $S.$@

signals.%: $S/signals/%.py $S/generate_pgf.py
	python -m $S.$@

$I/%: $S/%.tex $S/notefig.cls
	cd $S && $(LATEX) $(LATEX_ARGS) $(<F) && mv $(@F).pdf ../$I && echo

pdfs: $(PDFS)

images: $(IMGS) $(foreach i,$(IMGTEXS),$I/$i)

all: $(IMGS) $(PDFS)
