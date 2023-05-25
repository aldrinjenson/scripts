#!/bin/bash

speed_counter=0

decrease_speed() {
    ((speed_counter--))
    echo "Speed Counter Decreased: $speed_counter"
}

increase_speed() {
    ((speed_counter++))
    echo "Speed Counter Increased: $speed_counter"
}

while true; do
    read -rsn1 key
    case "$key" in
        $'\x1b[D')  # Left arrow key
            decrease_speed
            ;;
        $'\x1b[C')  # Right arrow key
            increase_speed
            ;;
    esac
done
