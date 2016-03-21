#!/bin/bash
#please, run this script as root
#make directories
mkdir -p nvda-remote-server_1.1/usr/share/doc/nvda-remote-server
mkdir -p nvda-remote-server_1.1/usr/share/NVDARemoteServer
mkdir -p nvda-remote-server_1.1/usr/share/man/man1
#copy files
cp ../server.py ../server.pem ../daemon.py nvda-remote-server_1.1/usr/share/NVDARemoteServer
cp ../manual/NVDARemoteServer.1 nvda-remote-server_1.1/usr/share/man/man1
cp ../copyright nvda-remote-server_1.1/usr/share/doc/nvda-remote-server
cp ../changelog.debian nvda-remote-server_1.1/usr/share/doc/nvda-remote-server
#compress manual and changelog
gzip -9 nvda-remote-server_1.1/usr/share/man/man1/NVDARemoteServer.1
gzip -9 nvda-remote-server_1.1/usr/share/doc/nvda-remote-server/changelog.debian
#change permissions
chown -R root.root nvda-remote-server_1.1
chmod -R 755 nvda-remote-server_1.1
chmod 644 nvda-remote-server_1.1/DEBIAN/control
chmod 644 nvda-remote-server_1.1/DEBIAN/conffiles
chmod -x nvda-remote-server_1.1/usr/share/NVDARemoteServer/server.py
chmod -x nvda-remote-server_1.1/usr/share/NVDARemoteServer/server.pem
chmod -x nvda-remote-server_1.1/usr/share/NVDARemoteServer/daemon.py
chmod -x nvda-remote-server_1.1/usr/share/doc/nvda-remote-server/copyright
chmod -x nvda-remote-server_1.1/usr/share/man/man1/NVDARemoteServer.1.gz
chmod -x nvda-remote-server_1.1/usr/share/doc/nvda-remote-server/changelog.Debian.gz
#build the package
dpkg-deb --build nvda-remote-server_1.1
