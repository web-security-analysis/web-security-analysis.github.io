#!/bin/bash

##   W4B-02     :       W4B-02 is a beginner friendly web vulnerability checking tool
##   Author     :       Team , web-security-analysis
##   Version    :       1.0
##   Github     :       https://github.com/web-security-analysis/W4B-02

##   MIT License

##   Copyright (c) 2022 web security analysis

##   Permission is hereby granted, free of charge, to any person obtaining a copy
##   of this software and associated documentation files (the "Software"), to deal
##   in the Software without restriction, including without limitation the rights
##   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
##   copies of the Software, and to permit persons to whom the Software is
##   furnished to do so, subject to the following conditions:

##   The above copyright notice and this permission notice shall be included in all
##   copies or substantial portions of the Software.


##   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
##   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
##   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
##   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
##   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
##   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
##   SOFTWARE.

basic_pkgs() {
	if [[ $(command -v git) && $(command -v nmap) && $(command -v tor) && $(command -v python) && $(command -v python2) && $(command -v dnsutils) && $(command -v php) ]]; then
		echo -e "Installed."
	else
		pkgs=(git nmap tor python python2 dnsutils php)
		for pkg in "${pkgs[@]}"; do
			type -p "$pkg" &>/dev/null || {
				echo -e "Installing package"
				if [[ $(command -v pkg) ]]; then
					pkg install "$pkg" -y
				elif [[ $(command -v apt) ]]; then
					sudo apt install "$pkg" -y
				elif [[ $(command -v apt-get) ]]; then
					sudo apt-get install "$pkg" -y
				elif [[ $(command -v pacman) ]]; then
					sudo pacman -S "$pkg" --noconfirm
				elif [[ $(command -v dnf) ]]; then
					sudo dnf -y install "$pkg"
				elif [[ $(command -v yum) ]]; then
					sudo yum -y install "$pkg"
				else
					echo -e "Install packages manually."
					exit 0
				fi
			}
		done
	fi
}
basic_pkgs
rm -rf kali-anonsurf
rm -rf hammer
rm -rf sqlmap
if [ -d kali-anonsurf ]; then
	rm -r kali-anonsurf
fi
if [ -d hammer ]; then
	rm -r hammer
fi
if [ -d sqlmap ]; then
	rm -r sqlmap
fi
clear
echo "Please Wait..."
git clone https://github.com/sqlmapproject/sqlmap >/dev/null 2>&1
if [ -d sqlmap ]; then
	echo ""
else
	git clone https://github.com/sqlmapproject/sqlmap
fi
	git clone https://github.com/Und3rf10w/kali-anonsurf >/dev/null 2>&1
if [ -d kali-anonsurf ]; then
	echo ""
else
	git clone https://github.com/Und3rf10w/kali-anonsurf
fi
	git clone https://github.com/cyweb/hammer >/dev/null 2>&1
if [ -d hammer ]; then
	echo ""
else
	git clone https://github.com/cyweb/hammer
fi
	rm move.sh
if [ -f move.sh ]; then
rm -r move.sh
fi
clear
