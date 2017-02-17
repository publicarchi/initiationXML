# @prequisites make, saxon, jing
ECHO=
ROOT=/Users/emmanuelchateau/publicarchitectura/initiationXML
SOURCES=/Users/emmanuelchateau/publicarchitectura/initiationXML/sources
SAXON=/Library/Java/Extensions/SaxonHE9-5-1-6J/saxon9he.jar
SCHEMA=http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng
CURRENT=`pwd`

default: html

html:
	cd $(SOURCES); \
	for file in *.xml; do \
		echo $(basename $$file); \
		teitohtml --profile=formations $$file $$file.html; \
	done
