cd /root && wget 'https://staticassets.meson.network/public/meson_cdn/v3.1.19/meson_cdn-linux-amd64.tar.gz' && tar -zxf meson_cdn-linux-amd64.tar.gz && rm -f meson_cdn-linux-amd64.tar.gz && cd ./meson_cdn-linux-amd64 && sudo ./service install meson_cdn && sudo ./meson_cdn config set --token=fdmbxmtufonkjjpqb60855facf68464d --https_port=443 --cache.size=20 && sudo ./service start meson_cdn
cat > /etc/systemd/system/meson.service <<EOL
[Unit]
Description=Example .NET Web API App running on Ubuntu

[Service]
WorkingDirectory=/root/meson_cdn-linux-amd64
ExecStart=/root/meson_cdn-linux-amd64/meson_cdn
Restart=always
RestartSec=10
KillSignal=SIGINT
User=root

[Install]
WantedBy=multi-user.target
EOL
sudo systemctl daemon-reload && sudo systemctl enable meson.service && sudo systemctl start meson.service
