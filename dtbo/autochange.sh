#!/bin/bash  
mkdir temp
./mkdtimg dump dtbo_a.image -b ./temp/dtb
cd ./temp
for((i=0;i<=15;i++));  
do
../dtc -I dtb -O dts dtb.$i -o $i.dts
done
#change sth. here like:
sed -i "s/mdss-dsi-panel-framerate = <0x3c>;/mdss-dsi-panel-framerate = <0x4b>;/g" `grep mdss-dsi-panel-framerate -rl *.dts`
for((i=0;i<=15;i++));  
do
../dtc -O dtb -o dtb.$i $i.dts
done
../mkdtimg create new-dtbo.img --page_size=4096 \
dtb.0 \
dtb.1 \
dtb.2 \
dtb.3 \
dtb.4 \
dtb.5 \
dtb.6 \
dtb.7 \
dtb.8 \
dtb.9 \
dtb.10 \
dtb.11 \
dtb.12 \
dtb.13 \
dtb.14 \
dtb.15 
cp new-dtbo.img ../
rm -rf temp
