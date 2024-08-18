#!/system/bin/sh
# 请不要硬编码 /magisk/modname/... ; 请使用 $MODDIR/...
# 这将使你的脚本更加兼容，即使Magisk在未来改变了它的挂载点
MODDIR=${0%/*}

# 这个脚本将以 late_start service 模式执行

# 安装脚本，用于在启动时设置ZRAM压缩算法为LZ4

ui_print "设置ZRAM压缩算法为LZ4…"

# 修改zram配置
if [ -d /sys/block/zram0 ]; then
    echo lz4 > /sys/block/zram0/comp_algorithm
    ui_print "ZRAM压缩算法设置为LZ4"
else
    ui_print "找不到ZRAM驱动设备"
fi

ui_print "安装完成"
