#!/bin/bash

# Get battery status
BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)
BATTERY_PERCENTAGE=$(cat /sys/class/power_supply/BAT0/capacity)
BATTERY_CURRENT=$(cat /sys/class/power_supply/BAT0/current_now)
BATTERY_CHARGE_NOW=$(cat /sys/class/power_supply/BAT0/charge_now)
BATTERY_CHARGE_FULL=$(cat /sys/class/power_supply/BAT0/charge_full)

# Calculate remaining time in hours and minutes
if [ "$BATTERY_STATUS" == "Discharging" ]; then
    # Current power consumption in watts (assuming voltage_now is in microvolts and current_now is in microamperes)
    VOLTAGE_NOW=$(cat /sys/class/power_supply/BAT0/voltage_now)
    POWER_NOW=$(echo "scale=2; ($BATTERY_CURRENT * $VOLTAGE_NOW) / 1000000000000" | bc)

    # Remaining energy in watt-hours
    ENERGY_NOW=$(echo "scale=2; ($BATTERY_CHARGE_NOW * $VOLTAGE_NOW) / 1000000000000" | bc)

    # Calculate remaining time in hours
    REMAINING_TIME=$(echo "scale=2; $ENERGY_NOW / $POWER_NOW" | bc)
    REMAINING_TIME_HOURS=$(echo "scale=0; $REMAINING_TIME / 1" | bc)
    REMAINING_TIME_MINUTES=$(echo "scale=0; ($REMAINING_TIME - $REMAINING_TIME_HOURS) * 60" | bc)
    REMAINING_TIME_FORMATTED="${REMAINING_TIME_HOURS}h ${REMAINING_TIME_MINUTES}m"
else
    REMAINING_TIME_FORMATTED="N/A"
fi

echo "$REMAINING_TIME_FORMATTED"
