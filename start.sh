n = 0
for server in /opt/T6Server/t6z-revived/servers/*; do
    n++
    $server/start.sh &
    PID[$n]=$!
done

for i in ${PID[@]}; do
    wait $i
done