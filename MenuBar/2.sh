#!/bin/bash

PreferredMenuExtras=(
    "/Applications/Utilities/Keychain Access.app/Contents/Resources/Keychain.menu"
    "/System/Library/CoreServices/Menu Extras/AirPort.menu"
    "/System/Library/CoreServices/Menu Extras/Battery.menu"
    "/System/Library/CoreServices/Menu Extras/Bluetooth.menu"
    "/System/Library/CoreServices/Menu Extras/Clock.menu"
    "/System/Library/CoreServices/Menu Extras/Eject.menu"
)

## Get user context
currentUser=$3;echo "Current User: $currentUser"
userHome=$( dscl . read /Users/$currentUser NFSHomeDirectory | awk '{print $NF}' )
loggedInPID=$( ps -axj | awk "/loginwindow/ {print \$2;exit}" )

## Get list of current menu items
MenuExtras=$( defaults read "$userHome/Library/Preferences/com.apple.systemuiserver.plist" menuExtras | awk -F'"' '{print $2}' )
su $currentUser
for menuExtra in "${PreferredMenuExtras[@]}"; do
    menuShortName=$( echo "${menuExtra}" | awk -F'/' '{print $NF}' )
    if [[ $( echo "${MenuExtras}" | grep "${menuExtra}" ) ]]; then
        ## Menu extra already exists
        echo "Menu Extra \"${menuShortName}\" present"
    else
        ## Menu extra doesn't exist
        echo "Menu Extra \"${menuShortName}\" not in plist. Opening \"${menuExtra}\"..."
        menuItem=$menuExtra
        ## Open Menu extra so it is added to menu bar
        #sudo -u $currentUser open "$menuItem"
        #whoami
        /bin/launchctl bsexec "${loggedInPID}" sudo -iu "${currentUser}" "open \"$menuItem\""
    fi
done
