#!/bin/bash


z[0]="O"
z[1]="-O"
z[2]="--O"
z[3]="---O"
z[4]="----O"
z[5]="-----O"
z[6]="----O"
z[7]="---O"
z[8]="--O"
z[9]="-O"

while true
do
    for (( i = 0 ; i <= 9 ; i++ ))
    do
        echo -ne "\033[2K"
        echo ${z[i]}
    done
    
    # shifting array
    
    hold=${z[9]}
    for (( i = 9 ; i >=1 ; i-- ))
    do
        z[i]=${z[i-1]}
    done
    z[0]=$hold
    
    #sleep 0.07 
    sleep 0.05

    echo -e "\e[11A \r"
done
