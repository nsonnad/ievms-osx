VMS = \
	ie10-win7 \
	ie10-win8 \
	ie11-win7 \
	ie11-win8 \
	edge-win10

all: ${VMS}

tmp/ie10-win7.zip:
	mkdir -p $(dir $@)
	curl 'https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/VirtualBox/IE10/Mac/IE10.Win7.For.Mac.VirtualBox.zip' -o $@.download
	mv $@.download $@

tmp/ie10-win8.zip:
	mkdir -p $(dir $@)
	curl 'https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/VirtualBox/IE10/Mac/IE10.Win8.For.Mac.VirtualBox.zip' -o $@.download
	mv $@.download $@

tmp/ie11-win7.zip:
	mkdir -p $(dir $@)
	curl 'https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/VirtualBox/IE11/Mac/IE11.Win7.For.Mac.VirtualBox.zip' -o $@.download
	mv $@.download $@

tmp/ie11-win8.zip:
	mkdir -p $(dir $@)
	curl 'https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/VirtualBox/IE11/Mac/IE11.Win8.1.For.Mac.VirtualBox.zip' -o $@.download
	mv $@.download $@

tmp/edge-win10.zip:
	mkdir -p $(dir $@)
	curl 'https://az792536.vo.msecnd.net/vms/VMBuild_20160322/VirtualBox/MSEdge/MSEdge.Win10TH2.VirtualBox.zip' -o $@.download
	mv $@.download $@

ies/IE10.Win7/ie10-win7.ova: tmp/ie10-win7.zip
	mkdir -p $(dir $@)
	unar $< -o ies
	mv $(dir $@)IE10\ -\ Win7.ova $@

ies/IE10.Win8/ie10-win8.ova: tmp/ie10-win8.zip
	mkdir -p $(dir $@)
	unar $< -o ies
	mv $(dir $@)IE10\ -\ Win8.ova $@

ies/IE11.Win7/ie11-win7.ova: tmp/ie11-win7.zip
	mkdir -p ies
	unar $< -o ies
	mv $(dir $@)IE11\ -\ Win7.ova $@

ies/IE11.Win8.1/ie11-win8.ova: tmp/ie11-win8.zip
	mkdir -p $(dir $@)
	unar $< -o ies
	mv $(dir $@)IE11\ -\ Win8.1.ova $@

ies/EDGE.Win10/edge-win10.ova: tmp/edge-win10.zip
	mkdir -p $(dir $@)
	unar $< -o ies
	mv ies/MSEdge\ -\ Win10TH2.ova $@

ie10-win7: ies/IE10.Win7/ie10-win7.ova
	VBoxManage import $<

ie10-win8: ies/IE10.Win8/ie10-win8.ova
	VBoxManage import $<

ie11-win7: ies/IE11.Win7/ie11-win7.ova
	VBoxManage import $<

ie11-win8: ies/IE11.Win8.1/ie11-win8.ova
	VBoxManage import $<

edge-win10: ies/EDGE.Win10/edge-win10.ova
	VBoxManage import $<

clean:
	rm -rf tmp ies
