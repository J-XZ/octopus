#/bin/bash
exec_file=$(which gdb)
if [ -z "$exec_file" ]; then
    echo "Error: gdb not found."
    sudo apt update
    sudo apt install gdb -y
    exec_file=$(which gdb)
fi
sudo chmod 777 "$exec_file"
sudo chown root:root "$exec_file"
sudo chmod u+s "$exec_file"