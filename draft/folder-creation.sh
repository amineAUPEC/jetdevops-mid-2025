#!/bin/bash
year="$1"
year="2024"

month_shorter=("Jan" "Feb" "March" "Apr" "May" "June" "Jul" "Aug" "Sept" "Oct" "Nov" "Dec")
month=("January" "February" "March" "April" "May" "June" "July" "August" "September" "October" "November" "December")
len=31
for (( j=1; j<=len; j++ ));
do
    echo "$j-${month_shorter}"
done
# folder-creation.sh
