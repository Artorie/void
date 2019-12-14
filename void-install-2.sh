#!/bin/bash

#### Define text colors & print out Void Linux logo
{ B='\033[30;1m'  # Black-BRIGHT
C='\033[0;36m'  # Cyan
D='\033[32;1m'  # Green-BRIGHT
G='\033[32m'    # Green
R='\033[0;31m'  # RED
W='\033[0m'	    # WHITE
clear; }

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



####
#### WOT I STILL NEED TO DO
####
# ?) Bootloader (EFISTUB)
# ?) Need linux-firmware-* ??? (not sure if really needed for performance, CHECK FOR UCODE!)
