
SAXON_DIR = /Users/Shared/DocBook/lib/saxon
FOP_DIR = /Users/Shared/DocBook/lib/fop

PDF_DIR = /Users/cseppan/Documents/Work/DocBook/manual/pdf
HTML_DIR = /Users/cseppan/Documents/Work/DocBook/manual/html

all: html pdf

%.html: %.xml custom-html.xsl custom-common.xsl
	java -jar $(SAXON_DIR)/saxon.jar -t $< custom-html.xsl

%.pdf: %.xml custom-fo.xsl custom-common.xsl
	java -jar $(SAXON_DIR)/saxon.jar -t -o $(PDF_DIR)/$*.fo $< custom-fo.xsl
	$(FOP_DIR)/fop.sh $(PDF_DIR)/$*.fo $(PDF_DIR)/$@

html: manual.html

pdf: manual.pdf

clean:
	-rm $(PDF_DIR)/*.fo $(PDF_DIR)/*.pdf $(HTML_DIR)/*.html
