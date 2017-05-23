#! /usr/bin/bash
ALIEN_PATH=/opt/AlienPyFX
SCRIPT_PATH=/opt/AlienwareBattery

source $SCRIPT_PATH/current_profile
python2.7 $ALIEN_PATH/AlienPyFX_c.py --theme $ALIEN_PATH/afx-allgreen
