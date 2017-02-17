# @prequisites make, saxon, jing
ECHO=
ROOT=/Users/emmanuelchateau/publicarchitectura/initiationXML
SOURCES=/Users/emmanuelchateau/publicarchitectura/initiationXML/sources
PRESENTATIONS=/Users/emmanuelchateau/publicarchitectura/initiationXML/presentations
SAXON=/Library/Java/Extensions/SaxonHE9-5-1-6J/saxon9he.jar
SCHEMA=http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng
CURRENT=`pwd`

default: html slides clean

html:
	for file in $(SOURCES)/*.xml; do \
		echo 'teitohtml of ' $$file; \
	  	teitohtml --profile=formations $$file sources/$$file ; \
	done

slides: 
	for file in $(SOURCES)*.xml; do \
		echo 'teitoslide of' $$file; \
		$(SAXON) xsl/TEItoRemark.xsl > $$file; \
	done

clean:
	for i in *.tei.xml; do mv "$$i" "$${i%.*.*}.html"; \
	done \
	for i in presentations/*.tei.xml; do mv "$$i" "$${i%.*.*}.htm; done	
