#!/bin/bash
# start polybar
# Author: Jomkie



polybar-msg cmd quit

# Notic: The bar name of your polybar.
polybarLogName="polybar-$(date +%Y-%m-%d_%H:%M:%S).log"
echo "--" | tee -a /tmp/${polybarLogName}.log 
polybar example 2>&1 | tee -a /tmp/${polybarLogName} & disown
echo "bars launched..."
