#!/bin/bash

set -ouex pipefail

# Apply IP Forwarding before installing Docker to prevent messing with LXC networking
sysctl -p

# Installs extra packages
rpm-ostree install docker-ce docker-ce-cli docker-buildx-plugin docker-compose-plugin
rpm-ostree install code

#### Enabling System Unit Files

systemctl enable docker.socket
systemctl enable podman.socket
systemctl enable bluefin-dx-groups.service
systemctl enable --global bluefin-dx-user-vscode.service
