#!/usr/bin/env bash
while read -r 	LINE
do
CHAPTER=$(echo $LINE | awk '{print $1;}')
LINK=$(echo $LINE | awk '{print $2;}')
ENTITLE=$(echo $LINK | sed 's#.*sigao/\(.*\)_bible_Ch_.*#\1#')
TXTFILE=$(printf "%03d.txt" $CHAPTER)
FOLDER=$(grep $ENTITLE pairs.txt | awk '{print $2;}')
#[ -z "$FOLDER" ] && echo $LINK
#echo $LINK text/$FOLDER/$TXTFILE
../getbwsk.js $LINK | grep ^[0-9] > text/$FOLDER/$TXTFILE
echo $FOLDER/$TXTFILE
done < missing.txt
#done < chapter_links.txt
