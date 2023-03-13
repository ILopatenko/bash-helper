string="hello Hi Bye"


iterating(){
for word in $1; do
   echo $word
done
}


iterating "$string"