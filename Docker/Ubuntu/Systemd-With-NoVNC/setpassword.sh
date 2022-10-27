echo "headless:$PASSWORD" | chpasswd
echo $PASSWORD | vncpasswd -f
