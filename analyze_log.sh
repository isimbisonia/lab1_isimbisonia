#!/bin/bash

# Use the first argument as the log file, or transit_session.log if none is given
LOG_FILE="${1:-transit_session.log}"

# Stop with an error if the file does not exist
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: log file '$LOG_FILE' not found."
    exit 1
fi

echo "Reading: $LOG_FILE"
# Count how many times the simulation was run
SESSIONS=$(grep -c "New session started" "$LOG_FILE")

# Count zebra crossing stops
ZEBRAS=$(grep -c "Zebra crossing!" "$LOG_FILE")

# Count lane changes
LANES=$(grep -c "Changing lane:" "$LOG_FILE")

echo "Sessions     : $SESSIONS"
echo "Zebra stops  : $ZEBRAS"
echo "Lane changes : $LANES"
# Driver name and top speed of the latest trip (the last report in the log)
DRIVER=$(grep "Driver  *:" "$LOG_FILE" | tail -n 1 | sed 's/.*: *//')
TOP_SPEED=$(grep "Top speed  *:" "$LOG_FILE" | tail -n 1 | sed 's/.*: *//')

# If no trip was finished, there is no report yet
if [ -z "$DRIVER" ]; then
    DRIVER="not available"
    TOP_SPEED="not available"
fi

echo "Latest driver: $DRIVER"
echo "Top speed    : $TOP_SPEED"