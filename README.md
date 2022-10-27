# docker-images
images for Docker and Pterodactyl. Pterodactyl images include their egg (hopefully, if not make an issue to tell me!)

### Finished:
None yet

### Almost finished (problems, etc.)
Ubuntu in Pterodactyl

### In progress
None right now

### Might not finish, maybe you can? (Gave up because of problems, etc.)
Ubuntu in Docker with Systemd and NoVNC as a web client
- ENV: 
  - Use `PASSWORD` for VNC and root password
  - Use `RESOLUTION` for VNC resolution, example `1366x768`, `1920x1080`
- I gave up because I couldn't fix this error:
  - ```
    Explicit --user argument required to run as user manager.

    You will require a password to access your desktops.

    Password: Password too short
    /root/startup/startup.sh: line 4: /novnc/utils/novnc_proxy: No such file or directory
    ```
