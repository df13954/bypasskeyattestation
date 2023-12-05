# Error on < Android 8.
if [ "$API" -lt 26 ]; then
    abort "!!! You can't use this module on Android < 8.0"
fi

# Copy default pif.json if it doesn't exist.
if [ ! -e /data/adb/pif.json ]; then
	mv -f $MODPATH/pif.json /data/adb/pif.json
	mv -f $MODPATH/*.txt /data/local/tmp/
	chmod +rw /data/local/tmp
	ui_print "Moved default pif.json file!"
fi

# SafetyNet-Fix module is obsolete and it's incompatible with PIF.
if [ -d /data/adb/modules/safetynet-fix ]; then
    touch /data/adb/modules/safetynet-fix/remove
    ui_print "!!! SafetyNet-Fix module will be removed on next reboot."
fi

# MagiskHidePropsConf module is obsolete in Android 8+ but it shouldn't give issues.
if [ -d /data/adb/modules/MagiskHidePropsConf ]; then
    ui_print "!!! WARNING, 'MagiskHidePropsConf' module may cause issues with PIF"
fi
