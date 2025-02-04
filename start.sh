# Start each server and collect their PIDS
/opt/T6Server/t6z-revived/servers/origins_gungame/start.sh &
PID1=$!
/opt/T6Server/t6z-revived/servers/origins_solo/start.sh &
PID2=$!

# Wait for each server to finish
wait $PID1 $PID2