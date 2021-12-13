#!/bin/bash/

# NVME Disk Usage

Memusage() {
	memusage=$(free -h | grep Mem)

	echo -n "$memusage"
}

# System usage

Cpustatus() {
	cpustatus=$(iostat cpu | grep ^'           ')

	echo -n "$cpustatus"
}

# Define the clock
Clock() {
        DATETIME=$(date)

        echo -n "$DATETIME"
}

# Print the clock

while true; do
	echo "%{l}$(Clock) %{F-}%{B-} %{c}$(Memusage) %{r}Cpu: $(Cpustatus)"
        sleep 1
done

