VMS = \
	ie10-win7 \
	ie10-win8 \
	ie11-win7 \
	ie11-win8

all: ${VMS}

tmp/ie10-win7.zip:
	mkdir -p $(dir $@)
	curl 'https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/VirtualBox/IE10/Mac/IE10.Win7.For.Mac.VirtualBox.zip' -o $@.download
	mv $@.download $@

tmp/ie10-win8.zip:
	mkdir -p $(dir $@)
	curl 'https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/VirtualBox/IE10/Mac/IE10.Win8.For.Mac.VirtualBox.zip' -o $@.download
	mv $@.download $@

tmp/ie11-win7:
	mkdir -p $(dir $@)
	curl 'https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/VirtualBox/IE11/Mac/IE11.Win7.For.Mac.VirtualBox.zip' -o $@.download
	mv $@.download $@

tmp/ie11-win8.zip:
	mkdir -p $(dir $@)
	curl 'https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/VirtualBox/IE11/Mac/IE11.Win8.1.For.Mac.VirtualBox.zip' -o $@.download
	mv $@.download $@

IE10.Win7/ie10-win7.ova: tmp/ie10-win7.zip
	unzip $<
	mv $(dir $@)*.ova $@

IE10.Win8/ie10-win8.ova: tmp/ie10-win8.zip
	unzip $<
	mv $(dir $@)*.ova $@

IE11.Win7/ie11-win7.ova: tmp/ie11-win7.zip
	unzip $<
	mv $(dir $@)*.ova $@

IE11.Win8.1/ie11-win8.ova: tmp/ie11-win8.zip
	unzip $<
	mv $(dir $@)*.ova $@

ie10-win7: IE10.Win7/ie10-win7.ova
	VBoxManage import $<

ie10-win8: IE10.Win8/ie10-win8.ova
	VBoxManage import $<

ie11-win7: IE10.Win7/ie11-win7.ova
	VBoxManage import $<

ie11-win8: IE10.Win7/ie10-win7.ova
	VBoxManage import $<

clean:
	rm -rf tmp
