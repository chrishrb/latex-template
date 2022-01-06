DOC  := main.tex
BUILD_DIR := build/

RERUN := "(undefined references|Rerun to get (cross-references|the bars|point totals) right|Table widths have changed. Rerun LaTeX.|Linenumber reference failed)"
RERUNBIB := "No file.*\.bbl|Citation.*undefined"

all: create-dir doc

create-dir:
	-mkdir -p $(BUILD_DIR)

figs:
	@$(MAKE) -C $@

doc: $(DOC:.tex=.pdf)

%.pdf: %.tex
	pdflatex --enable-write18 --output-dir=$(BUILD_DIR) $<
	@egrep -q $(RERUNBIB) $(BUILD_DIR)/$*.log && bibtex $* && pdflatex $<; true
	@egrep -q $(RERUN) $(BUILD_DIR)/$*.log && pdflatex $<; true
	@egrep -q $(RERUN) $(BUILD_DIR)/$*.log && pdflatex $<; true

watch:
	-latexmk -pvc -pdf --enable-write18 -outdir=$(BUILD_DIR) $(DOC)

clean: 
	-rm -rf $(BUILD_DIR)/*

.PHONY: all figs clean
