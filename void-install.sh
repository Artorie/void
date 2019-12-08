#!/bin/bash

#### Define text colors & print out Void Linux logo
{ B='\033[30;1m'  # Black-BRIGHT
C='\033[0;36m'  # Cyan
D='\033[32;1m'  # Green-BRIGHT
G='\033[32m'    # Green
R='\033[0;31m'  # RED
W='\033[0m'	    # WHITE
clear; }

#### Check for Internet connection
	 # ip link && wpa_passphrase *SSID* *pw* > /etc/wpa_supplicant/wifi.conf && nano /etc/wpa_supplicant/wifi.conf && history -c && wpa_supplicant -B -i *iface* -c /etc/wpa_supplicant/wifi.conf
ping -c1 8.8.8.8 > /dev/null 2>&1 || 
	 { 	echo -e "${R}[ERROR] You need to be online for the installer to run!";
		echo -e "	Better run these commands:"
		echo -e "	${G}ip link";
		echo -e "	wpa_passphrase *SSID* *pw* > /etc/wpa_supplicant/wifi.conf";
		echo -e "	nano /etc/wpa_supplicant/wifi.conf";
		echo -e "	history -c";
		echo -e "	wpa_supplicant -B -i *iface* -c /etc/wpa_supplicant/wifi1.conf${W}";
		echo; echo; echo; exit; }
		
#### Print the Void Linux logo
{ echo && echo -e "${D}               _.,;=++##++=;,._"
echo -e "             ;o=+==++=++=+=+===;o,"
echo -e "              -=+++=@###U@+=+++++=b-"
echo -e "        ${W}${G}.-${D}     -=#:*^\`\`\`'^*+@=+=++==o."
echo -e "       ${W}${G}.Wvi,${D}    \"\`           \`-+=++++W,"
echo -e "      ${W}${G}.@uvnvi.${D}       _,._      \`$=+==#@,"
echo -e "      ${W}${G}#vvnvnI\`    ${D},+@#%@=@;,     &=||=##"
echo -e " ${B}+QmQQm${W}${G}pvvnv' ${B}=Y\`,yQQWUUQQQ+${G};${B} QmQY${G}\$${B}@QQWUV\$QQo."
echo -e "  *QQWQW${W}${G}pvvo${B}.Z! @QQQE${D}o+=${B}QWWQ${G}#${B}QWQW QQWw${G}+@=${B}jQWQu"
echo -e "   *WQQQQ${W}${G}v;${B}/U* +QQQ@${D}+#~${B}@WQQ${G}&${B}pQQQ mQQQ${G}+&#${B}jWQQ@'"
echo -e "    *\$WQ8YWv\`   +WQQwgQQW\"${G}@${B}oWQQ oQWQQgyyWWOP"
echo -e "      ${W}${G}01vvnvv.    ${D}\`~o+##+o*\"    .\$|+=+;@\`"
echo -e "      ${W}${G}+#vnvnnv-                ${D}\"-|===;#"
echo -e "       ${W}${G}\$Qvnvnvn\`~._        _.      ${D}:=+"
echo -e "        ${W}${G}*@Qnvnvvns#^@###@^#sv+.     ${D}\`"
echo -e "         ${W}${G}\`*;Qnvnvnvnnnnnnnnvvnn;,"
echo -e "            \`*#;nvnvnvvnvvvnnv+\`"
echo -e "                \`'\"^^***^'\"\`${W}" && echo; }

#### Partitioning and mounting
diskmodel=$(lsblk -no MODEL /dev/sda | sed -r '/^\s*$/d')
if [[ $(sed -n 's/0/SSD/p; t; s/1/HDD/p' /sys/block/sda/queue/rotational) = SSD ]]; then
  echo -e "${G}Selected the SSD ${D}\"$diskmodel\"${W}${G} as ${D}/dev/sda${W}"
else
  echo -e "${R}Selected the HDD \"$diskmodel\" as /dev/sda"
fi
echo "==============================================="
lsblk -no name,size,mountpoint /dev/sda
echo "==============================================="
echo -e "${D}/dev/sda1${W} will be ${D}/boot/efi${W} (>=200M)"
echo -e "${D}/dev/sda2${W} will be ${D}/${W}"
echo
while true; do
    read -p "Is this okay? Is there enough space in these partitions for their purpose? [y/n] " yn
    case $yn in
        [Yy]* ) echo -e "${D}Okay. Working...${W}" && umount -R /mnt > /dev/null 2>&1 ; mkfs.vfat -F32 /dev/sda1 > /dev/null 2>&1 && mkfs.f2fs -fl Void-Root /dev/sda2 > /dev/null 2>&1 && mount /dev/sda2 /mnt && mkdir -p /mnt/boot/efi && mount /dev/sda1 /mnt/boot/efi && break;;
        [Nn]* ) echo -e "${R}Aborted! Killing the script right now."; echo; echo; echo; echo -e "Run \"cfdisk\" and set up your partitions accordingly!${W}"; echo; echo; echo; exit;;
        * ) echo -e "${R}Please answer with \"${G}yes${R}\" or \"${G}no${R}\". Try again:${W}";;
    esac
done

#### Installing the base system
xbps-install -S -R http://alpha.de.repo.voidlinux.org/current -r /mnt base-files coreutils libgcc bash grep sed util-linux which shadow f2fs-tools dosfstools psmisc procps-ng tzdata pciutils usbutils iana-etc kbd iproute2 iputils traceroute kmod acpid eudev      runit-void xbps linux5.4 dracut > /dev/null

