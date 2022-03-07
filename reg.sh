read -p "Description: " ds
read -p "Link: " lk
read -p "Last Date: " dt

updatetl "Description: $ds"
updatetl "Link: $lk"
updatetl "Last Date to Apply [dd/mm/yy]: $dt"

dt=`sed 's/\///g' <<< $dt`
echo "$dt $lk des=$ds" >> reg.txt
