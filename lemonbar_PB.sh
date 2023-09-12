#!/bin/bash/

# NVME Disk Usage

Memusage() {
	memusage=$(free -h | grep Mem)

	echo -n "$memusage"
}

# System usage

Cpustatus() {
	cpustatus=$(iostat cpu | grep ^'          ')

	echo -n "$cpustatus"
}

# Define the clock
Clock() {
        DATETIME=$(date)

        echo -n "$DATETIME"
}

Battery() {
	BATTERY=$(acpi|cut -c -27|sed 's/%, c/%/g')

	echo -n "$BATTERY"
}

# Print the clock

while true; do
	echo "%{l}$(Memusage)%{F-}%{B-} %{c}$(Clock)  $(Battery) %{r}Cpu: $(Cpustatus)"
        sleep 1
done
