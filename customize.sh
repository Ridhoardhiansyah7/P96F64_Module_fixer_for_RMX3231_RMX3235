#!/system/bin/sh
LATESTARTSERVICE=true

# Display device informations
ui_print"============================================"
ui_print "          DEVICE INFORMATION               "
ui_print "==========================================="
ui_print "    DEVICE         : $(getprop ro.build.product)"
ui_print "    MODEL          : $(getprop ro.product.model)"
ui_print "    HARDWARE       : $(getprop ro.hardware)"
ui_print "    SOC            : $(getprop ro.soc.model)"
ui_print "    MANUFACTURER   : $(getprop ro.product.vendor.manufacturer)"
ui_print "    PROCESSOR      : $(getprop ro.board.platform)"
ui_print "    RAM            : $(free -m | grep Mem | awk '{print $2" MB"}')"
ui_print "    ANDROID VERSION: $(getprop ro.build.version.release)"
ui_print "    KERNEL VERSION : $(uname -r)"
ui_print "==========================================="
