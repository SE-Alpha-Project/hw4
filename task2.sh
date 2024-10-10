
temp_file=$(mktemp)

for file in dataset1/*; do
  if grep -q "sample" "$file"; then
    count=$(grep -o "CSC510" "$file" | wc -l)
    if [ "$count" -ge 3 ]; then
      size=$(stat -c%s "$file")
      echo "$count $size $file" >> "$temp_file"
    fi
  fi
done

sort -k1,1nr -k2,2n "$temp_file" | while read count size file; do
  new_file=$(echo "$file" | sed 's/file_/filtered_/')
  echo "$new_file"
done

rm "$temp_file"
