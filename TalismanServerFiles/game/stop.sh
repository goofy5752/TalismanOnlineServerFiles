#!/bin/bash
killall hqguard
sleep 2
killall hqguard
sleep 2

cd /home/game/db
rm -f *.pid

sleep 2
cd /home/game/login
rm -f *.pid 

cd /home/game/login/anti
rm -f *.log
sleep 2
cd /home/game/game
rm -f *.pid

cd /home/game/game/anti
rm -f *.log
sleep 2
