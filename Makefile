all: html

html: all-html

pdf: all-pdf

clean: all-clean

all-html:
	cd doc-Service-Assurance-Framework && $(MAKE) html

all-pdf:
	cd doc-Service-Assurance-Framework && $(MAKE) pdf

all-clean:
	cd doc-Service-Assurance-Framework && $(MAKE) clean
