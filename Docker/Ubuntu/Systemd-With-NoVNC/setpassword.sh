echo "root:$PASSWORD" | chpasswd
echo $PASSWORD | vncpasswd -f
