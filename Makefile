
SAXON_DIR = /usr/local/docbook/saxon
FOP_DIR = /usr/local/docbook/fop
XEP_DIR = /usr/local/docbook/xep

PDF_DIR = /Users/cseppan/Documents/Work/DocBook/manual/pdf
HTML_DIR = /Users/cseppan/Documents/Work/DocBook/manual/html
XML_DIR = /Users/cseppan/Documents/Work/DocBook/manual/xml

all: html pdf

%.html: %.xml custom-html.xsl custom-common.xsl
	java -jar $(SAXON_DIR)/saxon.jar -t $< custom-html.xsl

%.fo: %.xml custom-fo.xsl custom-common.xsl
	java -jar $(SAXON_DIR)/saxon.jar -t -o $@ $< custom-fo.xsl

%.pdf: %.fo
	#$(FOP_DIR)/fop.sh $*.fo $(PDF_DIR)/$*_fop.pdf
	cd $(XEP_DIR); java -Xmx512M -jar lib/xep.jar -fo $(XML_DIR)/$< -pdf $(PDF_DIR)/$@

html: manual.html

pdf: manual.pdf

clean:
	-rm $(XML_DIR)/*.fo $(PDF_DIR)/*.pdf $(HTML_DIR)/*.html
