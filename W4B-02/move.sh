#!/bin/bash
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
