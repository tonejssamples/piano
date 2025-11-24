#!/bin/bash

# Loop through all matching files
for file in Player_dyn3_rr1_*.wav; do
    # Extract the number part
    num=$(echo "$file" | sed 's/Player_dyn3_rr1_\([0-9]*\)\.wav/\1/')
    
    # Remove leading zeros and calculate MIDI number
    num_clean=$((10#$num))
    midi=$((21 + num_clean * 2))
    
    new_name="${midi}.wav"
    echo "Renaming: $file -> $new_name"
    mv "$file" "$new_name"
done

echo "Done!"
