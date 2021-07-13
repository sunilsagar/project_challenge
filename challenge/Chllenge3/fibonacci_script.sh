#!/bin/bash
# Purpose : Generate Fibonacci series and find sum of it
# Version : 1.0.0
# Date Created : 10 Jul 2021
# Date Modified : 10 Jul 2021
# Author : Sunil Sagar , Contact : 

## BEGIN

function validate_user_input(){
   while :;do
     read -ep 'Enter a number [1 - 100]: ' user_number
     [[ $user_number =~ ^[[:digit:]]+$ ]] || continue
     (( ( (user_number=(10#$user_number)) <= 100 ) && user_number >= 1)) || continue
     #echo "member-count: $user_number"
     break
   done 
}

function print_series(){
  a=1
  b=2
  sequence=$(echo -n '[ '
  f_series=$(for (( i=0; i<user_number; i++ ))
  do
    echo -n "$a, "
    fn=$((a + b))
    a=$b
    b=$fn
  done)
  echo -n $f_series | sed 's/.$//'
  echo -n ' ]')
  #echo "$sequence"
}

function sum_series(){
  a=1
  b=2
  f_series=$(for (( i=0; i<user_number; i++ ))
  do
    echo -n "$a "
    fn=$((a + b))
    a=$b
    b=$fn
    done)
   array=$f_series
   total=0
   for i in ${array[@]}; do
     let total+=$i
   done
   #echo $total
}

function print_output(){
  output=$(echo "member-count: ${user_number}"; echo "sequence: ${sequence}"; echo "total: ${total}") 
  echo "${output}" | jq -s -R '[[ split("\n")[] | select(length > 0) | split(": +";"") | {(.[0]): .[1]}] | add]'  
}

validate_user_input
print_series
sum_series
print_output


## END
