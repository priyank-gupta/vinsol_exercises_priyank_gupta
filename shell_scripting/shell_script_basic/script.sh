#!/bin/bash

echo The home directory is : $HOME

echo The terminal type we are using is: $TERM

echo List of services started in runlevel 3

chkconfig --list | grep '3:on'
