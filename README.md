# stf-documentation

This is upstream source code of Service Telemetry Framework
documentation. All content in this repository uses
[AsciiDoctor](https://asciidoctor.org/) syntax and aims to follow [Guidelines
for Red Hat Documentation](https://redhat-documentation.github.io/). This is a
**work in progress*.

## Building

Install the required tools. On Fedora, enter the following command:

    dnf -y install rubygem-asciidoctor rubygem-asciidoctor-pdf make

On MacOS, to install the required tools, use brew and replace the "make" command with
"gmake":

    brew install asciidoctor make

Alternatively, you can install the XCode development environment so that the "make" utility is available on PATH.
However, you must ensure you have several gigabytes of HDD space available and allow for approximately an hour to download and install the XCode development environment:

    xcode-select --install

If AsciiDoctor is not available in repositories or under RVM/rbenv,
install it from rubygems:

    gem install asciidoctor asciidoctor-pdf --pre

Run `make` or `make html`, which builds HTML output. Generating
PDF output is slow, therefore use the `make pdf` command separately. To
make both formats in one command, use `make html pdf`. To build downstream
version perform `make BUILD=downstream browser`.

Few additional `make` targets are available on the guide level. To build
HTML version and to view it in a new tab in a browser, enter the following commands:

    cd doc-Service-Telemetry-Framework
    make browser

To build and open PDF version, enter the following command:

    make open-pdf

You can find the final artifacts in the ./build subdirectory. Note that GNU
Makefile tracks changes and only builds relevant artifacts, to trigger full
rebuild use `make clean` to delete build directory and start over.

## Reading or publishing

Publishing the upstream documentation is done automatically on merge to the
`master` branch. Automation in Travis-CI then results in a built HTML
output that is pushed into the `gh-pages` branch. You can read the content at:
https://infrawatch.github.io/documentation

## Contributing

Read [Guidelines for Red Hat Documentation](https://redhat-documentation.github.io/) before you open a Pull
Request. Additional rules apply:

Never write "Service Telemetry Framework" or "STF" words directly but use the following variables:

| Variable                      | Upstream value                 | Downstream value                     |
| --------                      | --------------                 | ----------------                     |
| Project                       | Service Telemetry Framework    | Service Telemetry Framework          |
| ProjectShort                  | STF                            | STF                                  |
| OpenShift                     | OpenShift                      | Red Hat OpenShift Container Platform |
| OpenStack                     | OpenStack                      | Red Hat OpenStack Platform           |
| OpenStackShort                | OSP                            | RHOSP                                |
| OpenStackVersion              | Wallaby                        | 17.0                                 |
| OpenStackLong                 | {OpenStack} {OpenStackVersion} | {OpenStack} {OpenStackVersion}       |
| OpenStackInstaller            | TripleO                        | Director                             |
| OVirt                         | oVirt                          | Red Hat Virtualization               |
| OVirtShort                    | oVirt                          | RHV                                  |
| MessageBus                    | Apache Qpid Dispatch Router    | AMQ Interconnect                     |
| SupportedOpenShiftVersion     | 4.7                            | 4.7                                  |
| NextSupportedOpenShiftVersion | 4.8                            | 4.8                                  |

Variables cannot be used in shell or code examples. To use them, use "attributes" keyword:

	[options="nowrap" subs="+quotes,+attributes"]
	----
	# ls {VariableName}
	----

Hide or show specific blocks, paragraphs, warnings or chapters by using a special
variable called build. You can set the value of build to either "downstream" or
"upstream":

	ifeval::["{build}" == "upstream"]
	NOTE: This part is only relevant for deployments with Katello plugin.
	endif::[]

When you perform a review, check out the topic branch and put the necessary
changes on top of the author's work instead of making many comments on github.

Avoid using phases like "Starting from version 6.5 or 1.22" because it is not possible to easily translate these strings in both the streams.
