# base directories for applications and data
APPS_DIR = /nas01/depts/ie/cempd/apps/SMOKE_archive/DocBook
BASE_DIR = /nas01/depts/ie/cempd/apps/SMOKE_archive/smoke_development/manual

# application locations
JAVA_EXE = /nas01/depts/ie/cempd/apps/SMOKE_archive/java/jre1.7.0_05/bin/java
SAXON_DIR = $(APPS_DIR)/xep-3.8.4/lib
XEP_DIR = $(APPS_DIR)/xep-3.8.4

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
	cd $(XEP_DIR); $(JAVA_EXE) -Xmx512M -jar lib/xep384_client_academic.jar -Dcom.renderx.xep.VALIDATION=false -fo $(XML_DIR)/$< -pdf $(PDF_DIR)/$@
	mv $(XML_DIR)/$< $(PDF_DIR)/$<

html: manual.html

pdf: manual.pdf

clean:
	-rm $(PDF_DIR)/*.fo $(PDF_DIR)/*.pdf $(HTML_DIR)/*.html
