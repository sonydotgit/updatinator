cdt=`date +%d`
cmo=`date +%m`
cyr=`date +%y`

remindeve() {
while read -r line; do

    dt=`awk '{print($1)}' <<< $line`

    pdt=`sed 's/....$//' <<< $dt`      
    pmo=`sed 's/^..//;s/..$//' <<< $dt`
    pyr=`sed 's/^....//' <<< $dt`

    ddiff=`expr $pdt - $cdt` 
    mdiff=`expr $pmo - $cmo`
    ydiff=`expr $pyr - $cyr`

    if [[ ( ( $mdiff -eq -11 || $mdiff -eq 1 ) && ( $ydiff -eq 1 || $ydiff -eq 0 ) && $ddiff -le -27 ) || ( $mdiff -eq 0 && $ydiff -eq 0 && $ddiff -le 3 ) ]]; then
    
        ds=`sed 's/.*ds=//' "$1"`
        lk=`awk '{print($2)}' <<< $line`
       
       updatetl "Description: $ds"
       updatetl "Link: $lk"

        if [ "$1" = "tst.txt" ]; then
            tm=`awk '{print($3)}' <<< $line`
            updatetl "The test is on $pdt/$pmo/$pyr at $tm"
            #echo "The test is on $pdt/$pmo/$pyr at $tm"
        else
            updatetl "Last Date for Registration is $pdt/$pmo/$pyr"
            #echo "Last Date for Registration is $pdt/$pmo/$pyr"
        fi

    fi

    if [ $dt = `date +%d%m%y` ]; then
        sed -i "/$line/d" "$1"
    fi
       
done < "$1"
}

if [ `stat --printf="%s" reg.txt` -ne 0 ];then
    updatetl "-- BEGIN REGISTRATION --"
    remindeve "reg.txt"
    updatetl "-- END REGISTRATION --"
fi

if [ `stat --printf="%s" tst.txt` -ne 0 ];then
    updatetl "-- BEGIN TEST --"
    remindeve "tst.txt"
    updatetl "-- END TEST --"
fi
