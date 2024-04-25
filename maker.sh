printf "\x1bc\x1b[43;37m"
roots=$(pwd)/roots
tmps=/tmp/lists.txt
tmps2=/tmp/lists2.txt
mkdir -p $roots
mkdir -p $roots/usr
mkdir -p $roots/usr/bin
mkdir -p $roots/bin
mkdir -p $roots/tmp
mkdir -p $roots/lib
mkdir -p $roots/dev
mkdir -p $roots/boot
mkdir -p $roots/proc
mkdir -p $roots/proc/self
mkdir -p $roots/usr/include
mkdir -p $roots/lib/i386-linux-gnu
cp  /lib/i386-linux-gnu/crt*.* $roots/lib/i386-linux-gnu/
cp  /usr/include $roots/usr/include
cp  ./hello.asm $roots/usr/bin
cp  ./hello.asm $roots/bin
cp  /proc/self/exe $roots/proc/self/
cp  /proc/self/exe $roots/usr/bin
cp  /proc/self/exe $roots/bin
cp  /usr/bin/as $roots/usr/bin
cp  /usr/bin/as $roots/bin
cp  /usr/bin/ld $roots/usr/bin
cp  /usr/bin/ld $roots/bin
cp  /usr/bin/nasm $roots/usr/bin
cp  /usr/bin/nasm $roots/bin
cp  /usr/bin/lli $roots/usr/bin
cp  /usr/bin/lli $roots/bin
cp  /usr/bin/bash $roots/usr/bin
cp  /usr/bin/bash $roots/bin
cp  /usr/bin/sh $roots/usr/bin
cp  /usr/bin/sh $roots/bin
cp  /usr/bin/ldd $roots/usr/bin
cp  /usr/bin/ldd $roots/bin
printf "" > $roots/dev/null
printf "" > $roots/dev/stdio
printf "" > $roots/dev/stdout
printf "" > $roots/dev/stdin
chmod 777 $roots/bin/*
chmod 777 $roots/usr/bin/*
printf "" > $tmps
list1=$(ls $roots/usr/bin/*)
for l1 in $list1
do
ldd "$l1" | grep  '/lib/' >> $tmps
done
awk '{for(i=1;i<=NF;i++) if($i ~ /\/lib\//) print $i}' $tmps > $tmps2
while IFS= read -r l1
do

rt="$roots$l1"
cp "$l1" "$rt" 
done < "$tmps2"




