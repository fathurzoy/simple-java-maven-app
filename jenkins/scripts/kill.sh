#!/usr/bin/env sh

echo 'The following command terminates the "mvn jar" process using its PID'
echo '(written to ".pidfile"), all of which were conducted when "deliver.sh" was executed.'

# Mengecek apakah file .pidfile ada dan tidak kosong
if [ -s .pidfile ]; then
    PID=$(cat .pidfile)
    echo "PID from .pidfile: $PID"

    # Mengecek apakah proses dengan PID yang ditemukan sedang berjalan
    if ps -p $PID > /dev/null; then
        echo "Process with PID $PID found, killing..."
        kill $PID
    else
        echo "Process with PID $PID not found or already stopped."
    fi
else
    echo ".pidfile is empty or does not exist. No process to kill."
fi