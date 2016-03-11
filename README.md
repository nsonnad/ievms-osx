A makefile to download / unpack / install [modern.ie](http://modern.ie/) VMs for
OSX/VirtualBox, for various versions of IE and Windows.

### Dependencies:

* VirtualBox
* requires the command line tool [unar][1] because Microsoft's zips are in some
newfangled Zip64 format, which is not supported by OSX's default `unzip`
command.

### Usage

Install `unar`, if necessary:

    brew install unar

Make the VM you want for a particular IE/Windows combination. The targets are:

    make ie10-win7
    make ie10-win8
    make ie11-win7
    make ie11-win8

Or you can just run

    make

to build all four versions. Each make target will automatically import your
VM into VirtualBox.

[1] https://unarchiver.c3.cx/commandline
