#!/bin/bash

# Define a timestamp function
timestamp() {
  date +"%T" # current time
}

# Save it to textfile
echo "Current Time : $(timestamp)" | tee /mycron_output/timestamps.txt
# echo "Current Time : $(timestamp)"