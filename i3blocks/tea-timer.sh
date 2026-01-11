#!/bin/bash

# Tea timer for i3blocks
# Save this as ~/.config/i3blocks/tea-timer

TIMER_FILE="/tmp/tea_timer"
DURATION=300  # 5 minutes in seconds

case $button in
    1) # Left click - start/stop timer
        if [ -f "$TIMER_FILE" ]; then
            # Timer is running, stop it
            rm "$TIMER_FILE"
        else
            # Start timer
            echo $(($(date +%s) + DURATION)) > "$TIMER_FILE"
        fi
        ;;
esac

# Check timer status
if [ -f "$TIMER_FILE" ]; then
    END_TIME=$(cat "$TIMER_FILE")
    NOW=$(date +%s)
    REMAINING=$((END_TIME - NOW))
    
    if [ $REMAINING -le 0 ]; then
        # Timer finished
        rm "$TIMER_FILE"
        notify-send "Tea is ready" 
        paplay /usr/share/sounds/freedesktop/stereo/complete.oga 2>/dev/null &
        echo "🫖"
        echo "🫖"
        echo "#808080"
    else
        # Timer running
        MINUTES=$((REMAINING / 60))
        SECONDS=$((REMAINING % 60))
        printf "🫖 %d:%02d\n" $MINUTES $SECONDS
        printf "🫖 %d:%02d\n" $MINUTES $SECONDS
    fi
else
    # Timer not running
    echo "🫖"
    echo "🫖"
    echo "#808080"
fi
