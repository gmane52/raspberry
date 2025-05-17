clear
echo ""
echo "Hello again $(whoami)"
uname -a | awk '{print $1 " " $2 " " $15}'

echo "" && echo "Ultimo reinicio:"
who -b | awk '$1 == "system" {print $2 " " $3 " " $4}'

echo "" && echo "IP del equipo:"
ip -4 addr show | awk '/^2: eth.*/ || /wlan.*/ || /inet / || /lo: /{print $2}'
ip=$(ip -4 addr show | awk '/^2: eth.*/ || /inet / || /lo: /{print $2}' | grep 192 | cut -d'/' -f1) 

echo "" && echo "Puertos abiertos:"
nmap $ip > /tmp/.scripts_inicio_nmap.txt
cat /tmp/.scripts_inicio_nmap.txt | grep -v "Starting" | grep -v "Nmap done"

echo "" && echo "Conexiones TCP:"
ss -ta | grep -v "State" | awk '{print $1 " " $4}'

echo "" && echo "Conexiones UDP:"
ss -ua | grep -v "State" | awk '{print $1 " " $4}'

# SLACK
#send_slack_message() {
#    local message=$1
#    curl -s -X POST -H 'Content-type: application/json' --data "{\"text\":\"$message\"}" $WEBHOOK_URL
#}

# URL del Webhook de Slack
#WEBHOOK_URL="https://hooks.slack.com/services/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"
#send_slack_message "Alerta: Nuevo inicio de sesión de $(whoami) \nUltimo reinicio: $(who -b | awk '$1 == "system" {print $2 " " $3 " " $4}')"
#echo ""