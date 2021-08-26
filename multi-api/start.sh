# runs 2 commands simultaneously:
cd pet-store
node index.js & # your first application
P1=$!
cd ../account-balance
node index.js & # your second application
P2=$!
wait $P1 $P2