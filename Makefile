all: html

html: all-html

pdf: all-pdf

clean: all-clean

browser: all-browser

all-html:
	cd doc-Service-Telemetry-Framework && $(MAKE) html

all-pdf:
	cd doc-Service-Telemetry-Framework && $(MAKE) pdf

all-clean:
	cd doc-Service-Telemetry-Framework && $(MAKE) clean

all-browser:
	cd doc-Service-Telemetry-Framework && $(MAKE) browser
