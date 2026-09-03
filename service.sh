#!/system/bin/sh

while [ "$(getprop sys.boot_completed)" != "1" ]; do 
    sleep 2
done
sleep 2

# fix srmi
ln -s /dev/spipe_lte7 /dev/spipe_lte15
chmod 0660 /dev/spipe_lte15
chown radio:radio /dev/spipe_lte15

# fix brightness
NODE_BRIGHTNESS="/sys/class/backlight/sprd_backlight/brightness"
NODE_MAX_BRIGHTNESS="/sys/class/backlight/sprd_backlight/max_brightness"

# match stock
echo 4095 > "$NODE_MAX_BRIGHTNESS"

while true; do
    if [ -f "$NODE_BRIGHTNESS" ]; then

        VAL=$(cat "$NODE_BRIGHTNESS")
        if [ "$VAL" -eq 0 ] 2>/dev/null; then
       
            WAKE_STATE=$(dumpsys power | grep "mWakefulness=")
            if echo "$WAKE_STATE" | grep -q "Awake"; then
                settings put system screen_brightness 10
                #echo 28 > "$NODE_BRIGHTNESS"
            fi

        elif [ "$VAL" -gt 0 ] && [ "$VAL" -le 37 ]; then
            NEW_VAL=$(( (VAL * 4095) / 37 ))
            echo "$NEW_VAL" > "$NODE_BRIGHTNESS"
        fi

    fi
    usleep 100000
done