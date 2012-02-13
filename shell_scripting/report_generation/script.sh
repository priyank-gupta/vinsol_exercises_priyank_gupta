#!/bin/bash

F=subscribers.txt

echo "Email address, City, Phone number" > $F

EMAIL_ID_LENGTH=$((RANDOM%10+2))

CHARS=( q w e r t y u i o p a s d f g h j k l z x c v b n m )
ADDRESS=( yahoo.com gmail.com hotmail.com rediffmail.com )
CITY_A=( Delhi Mumbai Chennai Kolkata )

for i in {1..100}; do
  
  EMAIL_ID=""
  
  while [ ${#EMAIL_ID} -le $EMAIL_ID_LENGTH ]; do

	  EMAIL_ID=$EMAIL_ID${CHARS[((RANDOM%26))]}

  done

  EMAIL_ID=$EMAIL_ID@${ADDRESS[((RANDOM%4))]}

  CITY=${CITY_A[((RANDOM%4))]}
  
  PHONE_NUM=""
  
  while [ ${#PHONE_NUM} -lt 10 ]; do
    if [ ${#PHONE_NUM} -eq 1 ]; then
      PHONE_NUM=$PHONE_NUM$((RANDOM%10+1))
    else
      PHONE_NUM=$PHONE_NUM$((RANDOM%10))
    fi
  done
  
  echo $EMAIL_ID, $CITY, $PHONE_NUM >> $F
  
done
