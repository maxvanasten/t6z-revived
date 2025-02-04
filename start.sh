#!/bin/bash

# Fetch latest files
git pull

# Clear config files
echo "Clearing config files"
rm -rf /opt/T6Server/Server/Zombie/main/*.cfg
# Clear mod files
echo "Clearing mod files"
rm -rf /opt/T6Server/Plutonium/storage/t6/mods/*

# For every directory in /opt/T6Server/t6z-revived/servers
for server in /opt/T6Server/t6z-revived/servers/*; do
    # Move config files
    echo "Moving config files"
    cp $server/*.cfg /opt/T6Server/Server/Zombie/main/
    # Move start file
    # cp $server/start.sh /opt/T6Server/Plutonium/
    # Move mod files
    echo "Moving mod files"
    if test -d $server/mods; then
        cp -r $server/mods/* /opt/T6Server/Plutonium/storage/t6/mods/
    fi
done

# Start each server and collect their PIDS
/opt/T6Server/t6z-revived/servers/origins_gungame/start.sh &
PID1=$!
/opt/T6Server/t6z-revived/servers/origins_solo/start.sh &
PID2=$!

# Start IW4MAdmin
cd /home/debian/iw4m
/home/debian/iw4m/StartIW4MAdmin.sh &
PID3=$!

# Wait for each server to finish
wait $PID1 $PID2 $PID3