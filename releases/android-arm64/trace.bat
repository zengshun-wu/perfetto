adb shell "chcon u:object_r:debugfs_tracing:s0 /sys/kernel/tracing/events/*"
adb shell "chmod 754 sys/kernel/tracing/events/*"
adb shell "chcon u:object_r:debugfs_tracing:s0 /sys/kernel/tracing/events/*/*/*"
adb shell "chmod 666 sys/kernel/tracing/events/*/*/enable"
adb push config.pbtx /data/misc/perfetto-configs/config.pbtx
pause
adb shell perfetto --txt -c /data/misc/perfetto-configs/config.pbtx -o /data/misc/perfetto-traces/trace.perfetto-trace
adb pull /data/misc/perfetto-traces/trace.perfetto-trace
pause