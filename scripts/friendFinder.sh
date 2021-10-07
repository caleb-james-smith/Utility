#!/bin/bash

# friendFinder.sh
# find out which nodes a user is logged into

# syntax
# ./friendFinder.sh <username>

user=caleb
host=cmslpc
friend=$1

echo "Hi $user."

if [ -z "$friend" ]
then
    echo "Plesae enter a username to find logged in to $host."
    exit 0
fi

echo "Findinlg nodes where $friend is logged in to $host."

#for i in {23..43}
for i in {23..140}
do
    # ssh and run who on each node
    ssh -AtY "$user"@"$host""$i".fnal.gov "who"  &> out
    a=$(grep $friend out)
    # check if variable is not empty
    if [ ! -z "$a" ]
    then
        echo "$host""$i"
    fi
    rm out
done

