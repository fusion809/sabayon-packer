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
<<<<<<< HEAD
  vagrant     \
  cleanup     \
  moksha
=======
  $VAGRANT    \
  $GUEST_ADDITIONS    \
  cleanup
>>>>>>> caae1bb9ec78519a4e42e88b3c739f1e8465965f
do
  "$SCRIPTS/scripts/$script.sh"
done

echo "All done."
