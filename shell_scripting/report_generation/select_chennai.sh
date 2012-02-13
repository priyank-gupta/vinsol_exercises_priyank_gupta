#!/bin/bash

F=subscribers.txt
output=select_chennai.txt

echo Email address, City, Phone number >$output

sed -n 's/.\+ Chennai.\+/&/p' $F >>$output
