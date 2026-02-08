### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers
# 禁止二改，小心黑砖

### AnyKernel setup
# global properties
properties() { '
kernel.string=KernelSU By KernelSU Developers
do.devicecheck=0
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


### AnyKernel install
## boot shell variables
block=boot
is_slot_device=auto
ramdisk_compression=auto
patch_vbmeta_flag=auto
no_magisk_check=1

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/flash-core.sh

kernel_version=$(cat /proc/version | awk -F '-' '{print $1}' | awk '{print $3}')
case $kernel_version in
    5.1*) ksu_supported=true ;;
    6.1*) ksu_supported=true ;;
    6.6*) ksu_supported=true ;;
    *) ksu_supported=false ;;
esac

ui_print " "
ui_print "chenhua13 Kernel | Oplus 6.6.89"
ui_print "创作者 / Creator： 陈华 (@mrcxlinux)"
ui_print " "
ui_print "特别感谢 cctv18 和 小小w，让这一切成为可能！"
ui_print "加入我的 Telegram：@mrcsreleases | @mrcsdiscussion"
ui_print "Special thanks to cctv18 and xiaoxiaow for making this possible!"
ui_print "Join my telegram: @mrcsreleases | @mrcsdiscussion"

ui_print " "
ui_print "我的项目完全免费，我不接受任何捐赠！"
ui_print "任何盗用并出售我作品的人都应该感到羞愧。"
ui_print "My projects are entirely free and I do not accept donations!"
ui_print "Anyone stealing from me and selling should be ashamed."
ui_print " " "  -> ksu_supported: $ksu_supported"
$ksu_supported || abort "  -> Non-GKI device, abort."

# boot install
split_boot
if [ -f "split_img/ramdisk.cpio" ]; then
    unpack_ramdisk
    write_boot
else
    flash_boot
fi
## end boot install
