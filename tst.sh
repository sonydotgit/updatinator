read -p "Enter Description: " ds
read -p "Enter link: " lk
read -p "Test date [dd/mm/yy]: " dt
read -p "Test time: " tm

dt=`sed 's/\///g' <<< $dt`
echo "$dt $lk $tm ds=$ds" >> tst.txt
