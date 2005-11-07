# base directories for applications and data
APPS_DIR = /afs/isis/depts/cep/emc/apps/DocBook
BASE_DIR = /afs/isis/depts/cep/emc/proj/smoke/docs/manual/current

# application locations
JAVA_EXE = /usr/bin/java
SAXON_DIR = $(APPS_DIR)/saxon
XEP_DIR = $(APPS_DIR)/xep

# input and output locations
XML_DIR = $(BASE_DIR)/xml
PDF_DIR = $(BASE_DIR)/pdf
HTML_DIR = $(BASE_DIR)/html

all: html pdf

%.html: %.xml custom-html.xsl custom-common.xsl
	$(JAVA_EXE) -jar $(SAXON_DIR)/saxon.jar -t $< custom-html.xsl

%.fo: %.xml custom-fo.xsl custom-common.xsl
	$(JAVA_EXE) -jar $(SAXON_DIR)/saxon.jar -t -o $@ $< custom-fo.xsl

%.pdf: %.fo
	cd $(XEP_DIR); $(JAVA_EXE) -Xmx512M -jar lib/xep384_client_academic.jar -fo $(XML_DIR)/$< -pdf $(PDF_DIR)/$@
	mv $(XML_DIR)/$< $(PDF_DIR)/$<

html: manual.html

pdf: manual.pdf

clean:
	-rm $(PDF_DIR)/*.fo $(PDF_DIR)/*.pdf $(HTML_DIR)/*.html
