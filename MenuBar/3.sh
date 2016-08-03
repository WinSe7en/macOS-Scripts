#!/bin/bash

# This script adds items to the menu bar if they are not currently shown.
# Author: Jason Olsen
# Date: 05/12/2014

#currUser=$(who | grep "console" | cut -d" " -f1)
currUser='ls -l /dev/console | cut -d " " -f4'

Keychain=$(su - "${currUser}" -c 'grep "Keychain.menu" /Users/$currUser/Library/Preferences/com.apple.systemuiserver.plist -c')
if [ $Keychain == 0 ]; then
    echo "Adding Keychain status to menu" 
    open '/Applications/Utilities/Keychain Access.app/Contents/Resources/Keychain.menu'
fi

AirPort=$(grep "AirPort.menu" /Users/$currUser/Library/Preferences/com.apple.systemuiserver.plist -c)
if [ $AirPort == 0 ]; then
    echo "Adding AirPort status to menu" 
    open '/System/Library/CoreServices/Menu Extras/AirPort.menu'
fi

HomeSync=$(grep "HomeSync.menu" /Users/$currUser/Library/Preferences/com.apple.systemuiserver.plist -c)
if [ $HomeSync == 0 ]; then
    echo "Adding HomeSync status to menu" 
    open '/System/Library/CoreServices/Menu Extras/HomeSync.menu'
fi

Battery=$(grep "Battery.menu" /Users/$currUser/Library/Preferences/com.apple.systemuiserver.plist -c)
if [ $Battery == 0 ]; then
    echo "Adding Battery status to menu" 
    open '/System/Library/CoreServices/Menu Extras/Battery.menu'
fi

Bluetooth=$(grep "Bluetooth.menu" /Users/$currUser/Library/Preferences/com.apple.systemuiserver.plist -c)
if [ $Bluetooth == 0 ]; then
    echo "Adding Bluetooth status to menu" 
    open '/System/Library/CoreServices/Menu Extras/Bluetooth.menu'
fi

Clock=$(grep "Clock.menu" /Users/$currUser/Library/Preferences/com.apple.systemuiserver.plist -c)
if [ $Clock == 0 ]; then
    echo "Adding Clock status to menu" 
    open '/System/Library/CoreServices/Menu Extras/Clock.menu'
fi

Volume=$(grep "Volume.menu" /Users/$currUser/Library/Preferences/com.apple.systemuiserver.plist -c)
if [ $Volume == 0 ]; then
    echo "Adding Volume status to menu" 
    open '/System/Library/CoreServices/Menu Extras/Volume.menu'
fi
