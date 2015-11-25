#!/bin/bash

chroot /mnt/sabayon /bin/bash <<'EOF'
equo rm sys-kernel/sabayon-sources sabayon-live sabayon-artwork-isolinux
pushd /etc/entropy/repositories.conf.d/
  mv entropy_sabayonlinux.org.example entropy_sabayonlinux.org
  mv _entropy_sabayon-limbo entropy_sabayon-limbo
popd
equo update
equo repo mirrorsort sabayon-weekly && equo repo mirrorsort sabayonlinux.org
equo upgrade && equo cleanup

cp /etc/systemd/system/autologin@.service \
    /usr/lib/systemd/system/getty@.service

rm -rf /etc/systemd/system/autologin@.service

sed -i -e 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i -e 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

equo i net-misc/wget =media-plugins/evas_generic_loaders-1.15.0 x11-wm/moksha
# Get configuration data
  JEF=https://github.com/JeffHoogland/bodhi3packages/raw/master/bodhi-profile-moksha/usr/share/enlightenment/data/config/bodhi
  L=('e.cfg' 'e_randr.cfg' 'exehist.cfg' 'module.battery.cfg' 'module.clock.cfg' 'module.conf.cfg' 'module.everything-apps.cfg' 'module.everything-files.cfg' 'module.everything.cfg' 'module.gadman.cfg' 'module.ibar.cfg' 'module.notification.cfg' 'module.pager.cfg' 'module.syscon.cfg' 'module.tasks.cfg')
  pushd /usr/share/enlightenment/data/config/default
    for i in ${L[*]}
    do
      wget -c $JEF/$i
    done
  popd
EOF

rm -rf /mnt/sabayon/usr/portage
rm -rf /mnt/sabayon/tmp/*
rm -rf /mnt/sabayon/var/log/*
rm -rf /mnt/sabayon/var/tmp/*

equo i zerofree

mount -o remount,ro /mnt/sabayon
zerofree /dev/sda4

swapoff /dev/sda3
dd if=/dev/zero of=/dev/sda3
mkswap /dev/sda3
