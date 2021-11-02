#
# Install Emacs from source with everything needed for a smooth Spacemace experience
#


sudo apt -y install git

[ -e ~/.emacs.d ] || git clone https://github.com/syl20bnr/spacemacs -b develop ~/.emacs.d

# Compile Emacs
git clone https://github.com/mirrors/emacs.git ~/emacs

sudo sed -i.save -E 's;(# deb-src http://)([a-z]{2})(.archive.ubuntu.com/ubuntu/ groovy universe);deb-src http://\2.archive.ubuntu.com/ubuntu/ groovy universe;g' /etc/apt/sources.list
sudo apt update
sudo apt -y build-dep emacs
sudo apt -y install build-essential automake texinfo libjpeg-dev libncurses5-dev libtiff5-dev libgif-dev libpng-dev libxpm-dev libgtk-3-dev libgnutls28-dev
# XWidgets support
sudo apt install libwebkit2gtk-4.0-dev

cd ~/emacs ; git checkout emacs-27.2
cd ~/emacs ; ./autogen.sh
cd ~/emacs ; ./configure --with-modules
cd ~/emacs ; make -j8
cd ~/emacs ; sudo make install

# Install font Source Code Pro
cd /tmp && wget --no-verbose -O source-code-pro.zip https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip
cd /tmp && unzip source-code-pro.zip -d source-code-pro
mkdir -p ~/.fonts
cp -v /tmp/source-code-pro/*/OTF/*.otf ~/.fonts/
fc-cache -fv
rm -rf /tmp/source-code-pro{,.zip}

# Install libtool for vterm
sudo apt install libtool-bin
