#! /usr/bin/env bash

# gather_hw_info.sh
#
# Collects the output of
#   - dmesg;
#   - lshw;
#   - lspci -knn;
#   - lsusb;
#   - cat /proc/cpuinfo
#   - cat /proc/config.gz;
#   - lsmod;
#   - modinfo per each module (useful to check aliases for [vendorid:deviceid]);
# for you to have the data for compiling a new kernel and not collect them
# each time you reboot.
#
# gather_hw_and_kernel_info.sh © deterenkelt, 2016


# Since we’re probably on a flash stick with a System Rescue CD,
#   try to place our file on the stick.
#
# Pass this variable through the environment, like
#     $ GATHER_HW_INFO_PARTITION="LABEL=my_rescue_stick" gather_hw_and_kernel_info.sh
# for this script to use this partition for storing files.
# It’s better to be placed in ~/.bashrc – or ~/.zshrc, if you haven’t customized
# the System Rescue CD.
[ -v GATHER_HW_INFO_PARTITION ] && {
	stor_part=`findfs $GATHER_HW_INFO_PARTITION 2>/dev/null` || {
		echo "Couldn’t find partition ‘$GATHER_HW_INFO_PARTITION’" >&2
	}
}

[ -v stor_part ] && {
	# If it was found, find where it’s mounted
	stor_mpoint=`sed -rn "s#^$stor_part\s+(\S+)\s*.*\\\$#\1#p;T;Q1" /proc/mounts` && {
		echo "Couldn’t find where ‘$stor_part’ is mounted to!" >&2
	}
}

test_file="$stor_mpoint/file_`date +%s`"
[ -d "$stor_mpoint" ] && {
	# If storage mountpoint is an actual directory, try to write there
	touch "$test_file" &>/dev/null || {
		# Try to remount with rw
		mount -o remount,rw "$stor_mpoint"
		touch "$test_file" &>/dev/null \
			|| echo "Cannot write to ‘$stor_mpoint’."
	}
}

[ -r "$test_file" ] && {
	use_user_storage=t
	rm "$test_file"
	:
}|| echo "I will use current directory to store files."

data_dir="${stor_mpoint:+$stor_mpoint/}${HOSTNAME}_gathered_info_`LC_TIME=C date +%Y%m%d-%H:%M:%S`"
mkdir "$data_dir"
cd "$data_dir"
which dmesg >/dev/null && dmesg &>dmesg
which lshw >/dev/null && lshw &>lshw
which lspci >/dev/null && lspci -knn &>lspci
which lsusb >/dev/null && lsusb &>lsusb
cat /proc/cpuinfo &>cpuinfo
cat /proc/cmdline &>cmdline
[ -r /proc/config.gz ] && {
	which zcat >/dev/null && zcat /proc/config.gz >.config
	:
} || echo '/proc/config.gz wasn’t found!' >&2
which lsmod >/dev/null && lsmod &>lsmod
mkdir modules
cd modules
modules=(`lsmod | sed -r '1d; s/^(\S+)\s.*$/\1/g'`)
for m in ${modules[@]}; do
	modinfo $m >$m
done
echo "Collected data written to $data_dir."
