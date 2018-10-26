insert()
{
 echo "Enter Name"
 read name
 echo "Enter Phone"
 read phn
 echo "Enter Address"
 read address
 echo "$1 | $name | $phn | $address" >> $addressdb
 echo "Record added successfully" 
}

modify()
{
	grep -v -w $1 $addressdb > tempdb
         echo "Enter Name"
 	read name
 	echo "Enter Phone"
 	read phn
 	echo "Enter Address"
 	read address
	cat tempdb > $addressdb
 	echo "$1 | $name | $phn | $address" >> $addressdb

}

delete()
{
	grep -v -w $1 $addressdb> tempdb
	cat tempdb > $addressdb
	echo "record delted successfully"
}
echo "Enter DB Name"
read addressdb

if [ -f $addressdb ]
then echo "File Already Exist"
else
echo "Roll NO | Name | Phone | Address" >$addressdb
fi

while(true)
do
echo "Enter Record. 2.Display Record. 3.Modify Record. 4.Delete Record. 5.View All."
echo "Enter Choice"

read ch
case $ch in

1)
  while [ true ]
  do
  echo "Enter Roll No"
  read rollno
  if ( grep -w $rollno $addressdb)
  then 
  echo "Record already exist"
  else 
  insert $rollno
  break
  fi
  done
  ;;

2) echo "Enter Roll No"
  read rollno
  if ( grep -w $rollno $addressdb)
  then 
  echo ""
  else 
  echo "Not Found"
  fi
  ;;
3)   echo "Enter Roll No to modify"
  read rollno
  if ( grep -w $rollno $addressdb)
  then
  modify $rollno
  else 
  echo "No such record found"
  fi
  ;;

4)   echo "Enter Roll No"
  read rollno
  if ( grep -w $rollno $addressdb)
  then 
  delete $rollno
  else 
  insert $rollno
  break
  fi
  ;;

5) cat $addressdb
   ;;

6) exit
   break
   ;; 

*) echo "enter valid"
   read ch

esac
done



