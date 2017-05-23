#! /usr/bin/bash
ALIEN_PATH=/opt/AlienPyFX
SCRIPT_PATH=/opt/AlienwareBattery

source $SCRIPT_PATH/current_profile
percent=`upower -i $(upower -e | grep BAT) | grep --color=never -E percentage|xargs|cut -d' ' -f2|sed s/%//`

if [[ $percent -gt 66 ]]
then
    # Good Battery
    echo "HIGH"
    python2.7 $ALIEN_PATH/AlienPyFX_c.py --theme $ALIEN_PATH/afx-green-battery-high
    newprofile="HIGH"
elif [[ $percent -gt 33 ]]
then
    # Medium
    echo "MID"
    python2.7 $ALIEN_PATH/AlienPyFX_c.py --theme $ALIEN_PATH/afx-green-battery-mid
    newprofile="MID"
elif [[ $percent -lt 33 ]]
then
    # low
    echo "LOW"
    python2.7 $ALIEN_PATH/AlienPyFX_c.py --theme $ALIEN_PATH/afx-green-battery-low
    newprofile="LOW"
else
    echo "ELSE"
    python2.7 $ALIEN_PATH/AlienPyFX_c.py --theme $ALIEN_PATH/afx-green-battery-high
    newprofile="NONE"
fi

if [[ $newprofile != "NONE" ]]
then
    rm $SCRIPT_PATH/current_profile
    echo "PROFILE=$newprofile" >> $SCRIPT_PATH/current_profile
fi
