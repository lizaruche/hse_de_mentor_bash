file_to_find=$1

# -f for file check
# -d for dir check
# -L for symbolic link

get_file_type() {
    type="other"
    if [[ -d $1 ]]; then
         type="d"
    elif [[ -L $1 ]]; then
         type="s"
    elif [[ -f $1 ]]; then
        type="f"
    fi
    
    echo "$type"
}

get_file_stats() {
   file_path=$1
   file_to_find=$2
   file_type=$(get_file_type $file_path) 
   file_permissions=$(stat -f %A $file_path) 

   if [[ "$1" =~ $2 ]]; then
	found_file=true
   else 
	found_file=false
   fi

   echo "$found_file:$file_permissions:$file_type:$file_path"	
}

result="founded_file:file_permissions:file_type:file_path" 
for file in ./* ./.*; do
    result+="\n"
    result+=$(get_file_stats $file $file_to_find)
done

echo $result | column -s: -t
