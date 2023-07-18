#!/bin/bash

# Directory where the result is stored.
RESULT_DIR="/home/ubuntu/skripte/data"

# FTP configuration
FTP_HOST=""
FTP_USER=""
FTP_PASS=""
FTP_DIRECTORY="."

# Create timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Create file for speed test result
RESULT_FILE="$RESULT_DIR/speedtest_$TIMESTAMP.json"

# Run Speedtest and write the result to the file in JSON format
speedtest-cli --json > "$RESULT_FILE"

echo "Speed test completed and result stored in $RESULT_FILE."

# Specify the name of the file on the FTP server
REMOTE_FILE="speedtest_result_$TIMESTAMP.json"

# FTP-Upload
ftp -n $FTP_HOST <<END_SCRIPT
quote USER $FTP_USER
quote PASS $FTP_PASS
cd $FTP_DIRECTORY
put "$RESULT_FILE" "$REMOTE_FILE"
quit
END_SCRIPT

echo "Result uploaded to FTP server."