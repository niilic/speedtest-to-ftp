# speedtest-to-ftp
The following Bash script is designed to perform a speed test using speedtest-cli. After running the test, the script stores the results in a JSON file. 
I use this script on a single-board computer running Ubuntu Server. A cron job is scheduled to execute the script every 15 minutes. 
Subsequently, the data stored on the FTP is displayed in a table on a PHP page.
