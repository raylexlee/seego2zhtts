#!/usr/bin/env bash
CHAPTER=${1?"missing chapter number"}
LINK=${2?"missing link ..."}
ENTITLE=$(echo $LINK | sed 's#.*sigao/\(.*\)_bible_Ch_.*#\1#')
TXTFILE=$(printf "%03d.txt" $CHAPTER)
FOLDER=$(grep $ENTITLE pairs.txt | awk '{print $2;}')
echo ../getbwsk.js $LINK greater text/$FOLDER/$TXTFILE
