#gather files
while read line; do
  filename=$(echo "$line" | sed -e "s#^.*[[:space:]]##g")
  files+=("$filename")
done < <(git status --porcelain)
