#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:40894464:b88670600d7211294c88259f1ef70e33bf039aa9; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:a0550badf33d5c6f1612fd4d27c9b6045be3e773 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:40894464:b88670600d7211294c88259f1ef70e33bf039aa9 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
