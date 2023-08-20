#!/bin/bash

# check if the number is greaterthan 10 or not
NUMBER=$1

if [ $NUMBER -gt 10 ]
then
    echo "$NUMBER is greatertahn 10"
else
    echo "$NUMBER is not greatertahn 10"
fi