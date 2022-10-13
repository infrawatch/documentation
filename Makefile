all: html

html: all-html

downstream: all-html-downstream

pdf: all-pdf

clean: all-clean

browser: all-browser

all-html:
	cd doc-Service-Telemetry-Framework && $(MAKE) html

all-html-downstream:
	cd doc-Service-Telemetry-Framework && $(MAKE) html BUILD=downstream

all-pdf:
	cd doc-Service-Telemetry-Framework && $(MAKE) pdf

all-clean:
	cd doc-Service-Telemetry-Framework && $(MAKE) clean

all-browser:
	cd doc-Service-Telemetry-Framework && $(MAKE) browser
