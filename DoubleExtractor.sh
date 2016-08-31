#!/bin/sh
# made by YuCheng on 2016/08/31
# move all your cg packege in Cleaned folder
# example : cg1/cg1.rar, cg2/cg2.rar 
# move cg1 & cg2 folder to Cleaned folder
# this script designed for jdownloder user
# because it failed to exact double-compress file 
echo "start search"
PATH=$PATH:/usr/bin/

# Cleaned folder
Cleaned=~/Documents/himizsu/nonexact

DEST=~/Documents/himizsu/nousedzz
find "$Cleaned" -mindepth 2 -type f -print -exec mv {} "$DEST" \;
list=`find "$DEST"  -type f -name "*.rar"`
list=${list// /ggininder}

# you can edit the pw from here
PASS=sugar77551160@eyny
for line in $list; do
con=${line:(-9)}
if [ "$con" == "[JPG].rar" ]; then
line=${line//ggininder/ }
unrar x "$line" -p$PASS  $DEST
rm "$line"
fi
done
newlist=`find "$DEST" -type f -name "*.7z"`
newlist=${newlist// /ggininder}
for newline in $newlist; do
newcon=${newline:(-8)}
if [ "$newcon" == "[JPG].7z" ]; then
newline=${newline//ggininder/ }
echo "test $newline"
7z -o"$DEST" x "$newline"
rm "$newline"
fi
done
rm -rf "$Cleaned"
mkdir "$Cleaned"
