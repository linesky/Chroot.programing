printf "\x1bc\x1b[43;37m"
roots=/mnt/isos
tmps=/mnt/isos/tmp/lists.txt
tmps2=/mnt/isos/tmp/lists2.txt

dd if=/dev/zero of="/tmp/my.img" bs=1k count=50000

sudo chmod 777 "/tmp/my.img"
sudo mkfs.vfat "/tmp/my.img" 
sudo chmod 777 "/tmp/my.img"
mkdir $roots
sudo mount "/tmp/my.img" $roots -o loop -t vfat 
mkdir -p $roots/tmp
printf "" > $tmps
printf "" > $tmps2
sudo chmod 777 $tmps
sudo chmod 777 $tmps2
mkdir -p $roots/usr
mkdir -p $roots/usr/bin
mkdir -p $roots/bin

mkdir -p $roots/lib
mkdir -p $roots/dev
mkdir -p $roots/boot
mkdir -p $roots/proc
mkdir -p $roots/proc/self
mkdir -p $roots/usr/include
mkdir -p $roots/lib/i386-linux-gnu
cp /lib/i386-linux-gnu/ld-linux.so.* $roots/lib/i386-linux-gnu/
cp /lib/i386-linux-gnu/libc.so.* $roots/lib/i386-linux-gnu/
cp  /lib/i386-linux-gnu/crt*.* $roots/lib/i386-linux-gnu/
cp  /lib/i386-linux-gnu/libc.a $roots/usr/bin
cp  /lib/i386-linux-gnu/libc.a $roots/bin
cp  /lib/i386-linux-gnu/libc.a $roots/lib/i386-linux-gnu/
cp  /usr/bin/bash $roots/usr/bin
cp  /usr/bin/bash $roots/bin
cp  /usr/bin/ld $roots/usr/bin
cp  /usr/bin/ld $roots/bin
cp  /usr/bin/nasm $roots/usr/bin
cp  /usr/bin/nasm $roots/bin
cp  /usr/bin/as $roots/usr/bin
cp  /usr/bin/as $roots/bin
cp  /usr/bin/sh $roots/usr/bin
cp  /usr/bin/sh $roots/bin
cp  /usr/bin/sh $roots/usr/bin
cp  /usr/bin/sh $roots/bin
cp  /usr/bin/ls $roots/usr/bin
cp  /usr/bin/ls $roots/bin
cp  /usr/bin/ldd $roots/usr/bin
cp  /usr/bin/ldd $roots/bin
cp ./hello.asm $roots/bin
printf "" > $roots/dev/null
printf "" > $roots/dev/stdio
printf "" > $roots/dev/stdout
printf "" > $roots/dev/stdin
chmod 777 $roots/bin/*
chmod 777 $roots/usr/bin/*
sudo chmod 777 $tmps
sudo chmod 777 $tmps2
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
sudo umount  $roots



