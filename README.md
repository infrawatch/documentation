# stf-documentation

This is upstream source code of [Service Telemetry
Framework](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/13/html/service_assurance_framework/index)
documentation. All content in this repository uses
[AsciiDoctor](https://asciidoctor.org/) syntax and aims to follow [Guidelines
for Red Hat Documentation](https://redhat-documentation.github.io/). This is a
**work in progress*.

## Building

Install the required tools. On Fedora, run the following command:

    dnf -y install rubygem-asciidoctor rubygem-asciidoctor-pdf make

On MacOS, to install the required tools use brew and replace the "make" command with
"gmake":

    brew install asciidoctor make

Alternatively, to make the "make" utility available on PATH, you can install the XCode development environment. 
However,  you must ensure you have several gigabytes of HDD space available and allow for approximately an hour to download and install the XCode development environment:

    xcode-select --install

If AsciiDoctor is not available in repositories or under RVM/rbenv,
install it from rubygems:

    gem install asciidoctor asciidoctor-pdf --pre

Run `make` or `make html` which builds HTML output. Generating
PDF output is slow, therefore use the `make pdf` command separately. To
make both formats in one command, use `make html pdf`. To build downstream
version perform `make BUILD=downstream`.

Few additional make targets are available on the guide level. To build
HTML version and open new tab in a browser, enter the following commands:

    cd doc-Service-Telemetry-Framework
    make browser

Similarly, to build and open PDF version do:

    make open-pdf

You can find the final artifacts in the ./build subdirectory. Note that GNU
Makefile tracks changes and only builds relevant artifacts, to trigger full
rebuild use `make clean` to delete build directory and start over.

## Reading or publishing

Publishing the upstream documentation is done automatically on merge to the
`master` branch. Automation in Travis-CI will then result in a built html
output being pushed into the `gh-pages` branch. You can read the content at:
https://infrawatch.github.io/documentation

## Contributing

Please read [Guidelines for Red Hat
Documentation](https://redhat-documentation.github.io/) before opening a Pull
Request. Additional rules apply:

Never write "Service Telemetry Framework" or "STF" words directly but use the following variables:

| Variable           | Upstream value                 | Downstream value                     |
| --------           | --------------                 | ----------------                     |
| Project            | Service Telemetry Framework    | Service Telemetry Framework          |
| ProjectShort       | STF                            | STF                                  |
| OpenShift          | OpenShift                      | Red Hat OpenShift Container Platform |
| OpenShiftShort     | OKD                            | OCP                                  |
| OpenStack          | OpenStack                      | Red Hat OpenStack Platform           |
| OpenStackVersion   | Train                          | 16                                   |
| OpenStackLong      | {OpenStack} {OpenStackVersion} | _same_                               |
| OpenStackInstaller | TripleO                        | Director                             |
| OVirt              | oVirt                          | Red Hat Virtualization               |
| OVirtShort         | oVirt                          | RHV                                  |
| MessageBus         | Apache Qpid Dispatch Router    | AMQ Interconnect                     |

Variables cannot be used in shell or code examples. To use them, use "attributes" keyword:

	[options="nowrap" subs="+quotes,+attributes"]
	----
	# ls {VariableName}
	----

Hide or show specific blocks, paragraphs, warnings or chapters via special
variable called "build". Its value can be set either to "downstream" or
"upstream":

	ifeval::["{build}" == "upstream"]
	NOTE: This part is only relevant for deployments with Katello plugin.
	endif::[]

When performing a review, consider checking out the topic branch and putting necessary
changes on top of the author's work instead of making many comments on github.

We should avoid using phases like, "Starting from version 6.5 or 1.22" because
it is not possible to easily translate these strings in both the streams.
