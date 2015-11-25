#!/bin/bash

export LC_ALL=en_US.UTF-8

if [[ -z $SCRIPTS ]]
then
  SCRIPTS=.
fi

chmod +x $SCRIPTS/scripts/*.sh

for script in \
  partition   \
  mounts      \
  copy        \
  timezone    \
  fstab       \
  grub        \
  vagrant     \
  cleanup     \
  moksha
do
  "$SCRIPTS/scripts/$script.sh"
done

echo "All done."
