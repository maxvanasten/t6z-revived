# Fetch latest files
git pull

# Clear config files
rm -rf /opt/T6Server/Server/Zombie/main/*.cfg
# Clear mod files
rm -rf /opt/T6Server/Plutonium/storage/t6/mods/*

# For every directory in /opt/T6Server/t6z-revived/servers
for server in /opt/T6Server/t6z-revived/servers/*; do
    # Move config file
    cp $server/*.cfg /opt/T6Server/Server/Zombie/main/
    # Move start file
    # cp $server/start.sh /opt/T6Server/Plutonium/
    # Move mod files
    if test -d $server/mods; then
        cp -r $server/mods/* /opt/T6Server/Plutonium/storage/t6/mods/
    done
done