LATEX := xelatex
LATEX_ARGS := -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape
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

%.pdf: %.tex notes.cls
	$(LATEXMK) $(LATEXMK_ARGS) $<

clean:
	rm *.synctex.gz *.loep *.qst
	$(LATEXMK) -c *.pdf
	rm -f *.pdf
	rm -rf images/*

rfcircuits.%: $S/rfcircuits/%.py $S/generate_pgf.py
	python -m $S.$@

signals.%: $S/signals/%.py $S/generate_pgf.py
	python -m $S.$@

pdfs: $(PDFS)

images: $(IMGS)

all: $(IMGS) $(PDFS)
