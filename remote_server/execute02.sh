if [ -e ~/rasp30/remote_server/fpaa_available ]
then
    rm ~/rasp30/remote_server/fpaa_available
    /opt/python3.4/bin/python3.4 ~/rasp30/remote_server/get_email02.py >> ~/Desktop/receive.log 2>&1
    grep -v 'Message can be printed here (Lot of garbage will appear on prompt)' ~/Desktop/receive.log > ~/Desktop/receive_temp.log
    mv ~/Desktop/receive_temp.log ~/Desktop/receive.log
    grep -v 'You have 0 new messages' ~/Desktop/receive.log > ~/Desktop/receive_temp.log
    mv ~/Desktop/receive_temp.log ~/Desktop/receive.log
    touch ~/rasp30/remote_server/fpaa_available
fi
