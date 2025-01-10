#!/bin/bash
set -x

############################################
# DSI CONSULTING INC. Project setup script #
############################################
# This script creates standard analysis and output directories
# for a new project. It also creates a README file with the
# project name and a brief description of the project.
# Then it unzips the raw data provided by the client.

mkdir analysis output
touch README.md
echo "# Project Name: DSI Consulting Inc." > README.md
touch analysis/main.py

# download client data
curl -Lo rawdata.zip https://github.com/UofT-DSI/shell/raw/refs/heads/main/02_activities/assignments/rawdata.zip
unzip rawdata.zip

###########################################
# Complete assignment here

# 1. Create a directory named data

mkdir data #making empty directory named "data"

# 2. Move the ./rawdata directory to ./data/raw

mv rawdata data/raw #moving rawdata to data/raw

# 3. List the contents of the ./data/raw directory

ls data/raw #lists contents of data/raw

# 4. In ./data/processed, create the following directories: server_logs, user_logs, and event_logs

mkdir data/processed #making a subdirectory named "processed" inside the directory data
cd data/processed #changing directories to processed 
mkdir server_logs user_logs event_logs #making three subdirectories in processed, "server_logs, user_logs, and event_logs"
cd - #going back to the directory assignments

# 5. Copy all server log files (files with "server" in the name AND a .log extension) from ./data/raw to ./data/processed/server_logs

 cp data/raw/server*.log data/processed/server_logs #moving all server.log files from server to server_logs

# 6. Repeat the above step for user logs and event logs

 cp data/raw/user*.log data/processed/user_logs    #moving all user.log files from server to user_logs
 cp data/raw/event*.log data/processed/event_logs #moving all event.log files from server to event_logs

# 7. For user privacy, remove all files containing IP addresses (files with "ipaddr" in the filename) from ./data/raw and ./data/processed/user_logs
rf -rf ./data
<<<<<<< HEAD

rm data/raw/ipaddr* #removing all ipaddr files from raw
rm data/raw/user_ipaddr* #removing user_ipadder files from raw
rm data/processed/user_logs/user_ipaddr* #removing user_ipadder files from user_logs
=======
>>>>>>> ea20676d33161a6f4d0fcd3c4f7aa5360f0f4309

# 8. Create a file named ./data/inventory.txt that lists all the files in the subfolders of ./data/processed

touch data/invetory.txt #making new file called "invetory.txt" in data
ls data/processed/server_logs >> data/invetory.txt #copying the list of contents of server_logs to invetory.txt
ls data/processed/user_logs >> data/invetory.txt #copying the list of contents of user_logs to invetory.txt
ls data/processed/event_logs >> data/invetory.txt #copying the list of contents of event_logs to invetory.txt



###########################################

echo "Project setup is complete!"
