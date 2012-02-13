#!/bin/bash

F=subscribers.txt
output=select_yahoo.txt

echo Email address, City, Phone number > $output
sed -n 's/.\+@yahoo.com.\+/&/p' $F >>$output
