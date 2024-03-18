#!/bin/bash

while true; do
    echo "Do you want the random numbers to start from 4 or 5? (Enter 4 or 5)"
    read choice

    if [ "$choice" -eq 4 ] || [ "$choice" -eq 5 ]; then
        echo "How many passwords do you want to generate? (Enter a number)"
        read num_passwords

        if [ -z "$num_passwords" ]; then
            echo "You didn't enter anything. Please enter a number."
        else
            echo "Generating $num_passwords random passwords starting from $choice:"
            for ((i=1; i<=$num_passwords; i++)); do
                password="$choice"
                for ((j=1; j<12; j++)); do
                    password+=$((RANDOM % 10))
                done
                echo "Password $i: $password"
            done
        fi
    else
        echo "Invalid choice. Please enter either 4 or 5."
    fi

    echo "Do you want to generate more passwords? (yes/no)"
    read answer
    if [ "$answer" != "yes" ]; then
        break
    fi
done
