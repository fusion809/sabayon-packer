# Get the dependencies
chroot /mnt/sabayon /bin/bash <<'EOF'
equo i =dev-libs/efl-1.15.2 net-misc/wget dev-vcs/subversion sys-devel/base-gcc sys-devel/gcc virtual/libstdc++ =media-plugins/evas_generic_loaders-1.15.0
equo i -o x11-wm/enlightenment:0.17
emerge =dev-libs/e_dbus-1.7.10
# Get the source code
wget -c https://github.com/JeffHoogland/moksha/archive/0.1.0.tar.gz | tar -xz
# Change into the source code directory
pushd moksha-0.1.0
  # Build
  ./autogen.sh --prefix=/usr && make && make install
  # Get the config files
  JEF=https://github.com/JeffHoogland/bodhi3packages/raw/master/bodhi-profile-moksha/usr/share/enlightenment/data/config/bodhi
  L=('e.cfg' 'e_randr.cfg' 'exehist.cfg' 'module.battery.cfg' 'module.clock.cfg' 'module.conf.cfg' 'module.everything-apps.cfg' 'module.everything-files.cfg' 'module.everything.cfg' 'module.gadman.cfg' 'module.ibar.cfg' 'module.notification.cfg' 'module.pager.cfg' 'module.syscon.cfg' 'module.tasks.cfg')
  pushd /usr/share/enlightenment/data/config/default
    for i in ${L[*]}
    do
      wget -c $JEF/$i
    done
  popd
popd
EOF
