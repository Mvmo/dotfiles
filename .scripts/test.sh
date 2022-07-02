languages=`echo "golang cpp c typescript rust nodejs java kotlin haskell ruby python" | tr ' ' '\n'`
core_utils=`echo "xargs find mv sed awk" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`
echo "selected: $selected"

read -p "query: " query

if echo $languages | grep -qs "$selected" ; then
    curl cht.sh/$selected/`echo $query | tr ' ' '+'`
else
    curl cht.sh/$selected~$query
fi

