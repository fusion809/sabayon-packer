sudo equo i dev-libs/efl dev-vcs/git dev-vcs/subversion sys-devel/base-gcc sys-devel/gcc virtual/libstdc++
sudo emerge =dev-libs/e_dbus-1.7.10::gentoo =media-plugins/evas_generic_loaders-1.15.0
cd ~
wget -c https://github.com/JeffHoogland/moksha/archive/0.1.0.tar.gz
tar -xzf 0.1.0.tar.gz
cd moksha-0.1.0
./autogen.sh --prefix=/usr
make
sudo make install
sudo rm -r ~/.e/e
cd /usr/share/enlightenment/data/config/default
export JEF=https://raw.githubusercontent.com/JeffHoogland/bodhi3packages/master/bodhi-profile-moksha/usr/share/enlightenment/data/config/bodhi
sudo wget -c $JEF/e.cfg $JEF/e_randr.cfg $JEF/exehist.cfg $JEF/module.battery.cfg $JEF/module.clock.cfg $JEF/module.conf.cfg $JEF/module.everything-apps.cfg $JEF/module.everything-files.cfg $JEF/module.everything.cfg $JEF/module.gadman.cfg $JEF/module.ibar.cfg $JEF/module.notification.cfg $JEF/module.pager.cfg $JEF/module.syscon.cfg $JEF/module.tasks.cfg
cd ~
wget -c https://github.com/JeffHoogland/MokshaRadiance/archive/master.tar.gz
tar -xzf master.tar.gz
mv MokshaRadiance-master/MokshaRadiance ~/.e/e/themes/
