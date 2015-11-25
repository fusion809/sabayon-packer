#!/bin/bash
# Get the dependencies
chroot /mnt/sabayon /bin/bash <<'EOF'
equo i -o moksha
equo i dev-vcs/subversion sys-devel/gcc virtual/libstdc++ evas_generic_loaders
# Get the source code
wget -cqO- https://github.com/JeffHoogland/moksha/archive/0.1.0.tar.gz | tar -xz
# Change into the source code directory
pushd moksha-0.1.0
  # Build
  ./autogen.sh --prefix=/usr && make && make install
  # Get the config files
  git clone https://github.com/JeffHoogland/moksha-profiles
  sudo cp -a moksha-profiles/bodhi /usr/share/enlightenment/data/config/
popd
EOF
