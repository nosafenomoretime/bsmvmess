echo "Download ngrok"
wget -q https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
tar -xvzf ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
chmod +x ngrok
read -p "Paste Ngrok Authtoken: " CRP
./ngrok authtoken $CRP 
./ngrok tcp 1013 >/dev/null 2>&1 >/dev/null &
sleep 2
echo '================================='
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo '================================='
python3 main.py config.json
