echo $PASSWORD | passwd --stdin root
echo $PASSWORD | vncpasswd -f
