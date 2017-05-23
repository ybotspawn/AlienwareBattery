#! /usr/bin/bash
ALIEN_PATH=/opt/AlienPyFX
SCRIPT_PATH=/opt/AlienwareBattery

source $SCRIPT_PATH/current_profile
percent=`upower -i $(upower -e | grep BAT) | grep --color=never -E percentage|xargs|cut -d' ' -f2|sed s/%//`

echo $percent
echo $PROFILE
if [[ $percent  > 66 ]] && [[ $PROFILE != "HIGH" ]]
then
    # Good Battery
    echo "HIGH"
    python2.7 $ALIEN_PATH/AlienPyFX_c.py --theme $ALIEN_PATH/afx-green-battery-high
    newprofile="HIGH"
elif [[ $percent > 33 ]] && [[ $PROFILE != "MID" ]]
then
    # Medium
    echo "MID"
    python2.7 $ALIEN_PATH/AlienPyFX_c.py --theme $ALIEN_PATH/afx-green-battery-mid
    newprofile="MID"
elif [[ $PROFILE != "LOW" ]] && [[ $percent < 33 ]]
then
    # low
    echo "LOW"
    python2.7 $ALIEN_PATH/AlienPyFX_c.py --theme $ALIEN_PATH/afx-green-battery-low
    newprofile="LOW"
else
    newprofile="NONE"
fi

if [[ $newprofile != "NONE" ]]
then
    rm $SCRIPT_PATH/current_profile
    echo "PROFILE=$newprofile" >> $SCRIPT_PATH/current_profile
fi
