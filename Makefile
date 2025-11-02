OUTDIR = output
TEXFILE = main

all:
	mkdir -p $(OUTDIR)
	pdflatex -output-directory=$(OUTDIR) $(TEXFILE).tex
	makeglossaries -d $(OUTDIR) $(TEXFILE)
	bibtex $(OUTDIR)/$(TEXFILE) || true
	pdflatex -output-directory=$(OUTDIR) $(TEXFILE).tex
	pdflatex -output-directory=$(OUTDIR) $(TEXFILE).tex

clean:
	rm -rf $(OUTDIR)

