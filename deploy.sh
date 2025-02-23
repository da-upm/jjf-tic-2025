#!/bin/bash

SERVICE=examenes

docker create --network=oauth2_net --ip 172.20.0.2 --restart=unless-stopped --env-file /srv/oauth2-proxy/$SERVICE.env -v /srv/oauth2-proxy/$SERVICE.auth:/$SERVICE.auth --name oauth2-$SERVICE quay.io/oauth2-proxy/oauth2-proxy:latest-amd64

echo "
[Unit]
Requires=docker.service
After=docker.service

[Service]
Type=simple
ExecStart=/usr/bin/env docker start -a oauth2-\$SERVICE
ExecStop=/usr/bin/env docker stop -t 10 oauth2-\$SERVICE
Restart=always
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=oauth2-\$SERVICE

[Install]
WantedBy=docker.service
" | sed "s/\$SERVICE/$SERVICE/g" > /etc/systemd/system/oauth2-$SERVICE.service

systemctl enable oauth2-$SERVICE.service
systemctl start oauth2-$SERVICE.service
