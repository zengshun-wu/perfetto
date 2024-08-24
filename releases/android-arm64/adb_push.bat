adb wait-for-device
adb remount
adb push traced /system/bin/traced
adb push traced_probes /system/bin/traced_probes
adb push libperfetto.so /system/lib64/libperfetto.so
adb push perfetto /system/bin/perfetto
adb reboot
adb wait-for-device
adb shell "chcon u:object_r:debugfs_tracing:s0 /sys/kernel/tracing/events/*"
adb shell "chmod 754 sys/kernel/tracing/events/*"
adb shell "chcon u:object_r:debugfs_tracing:s0 /sys/kernel/tracing/events/*/*/*"
adb shell "chmod 666 sys/kernel/tracing/events/*/*/enable"
pause
