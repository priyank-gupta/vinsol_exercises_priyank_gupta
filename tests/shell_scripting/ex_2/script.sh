#!/bin/bash

F=product_data.csv

> $F

Colors=( Red Blue Green Yellow )
Brands=( 'BRAND A' 'BRAND B' 'BRAND C' 'BRAND D' )
Size='270x243'
Sold_Out=( 0 1 )

if [ ! -d images ]; then
  mkdir images
else
  rm images/*
fi

for (( i=1;i<=$1;i++ )); do
  
  product_name=$i
  product_url=$product_name.jpg
  color=${Colors[((RANDOM % ${#Colors[@]}))]}
  brand=${Brands[((RANDOM % ${#Brands[@]}))]}
  sold_out=${Sold_Out[((RANDOM % ${#Sold_Out[@]}))]}

  echo $product_name,$product_url,$color,$brand,$sold_out >> $F

  if [ $sold_out -eq 1 ]; then
    sold_out='SOLD OUT'
  else
    sold_out=''
  fi

  convert -size $Size canvas:$color -gravity north -pointsize 60 -draw "text 0,25% '$product_name'" -pointsize 50 -gravity center -draw "text 0,0 '$brand'" -pointsize 40 -gravity south -draw "text 0,40% '$sold_out'" "images/$product_url"

done

cat $F
