recent=$(jq -r '.profileAssociations.workspaces | keys | .[]' ~/.config/Code/User/globalStorage/storage.json | tr ' ' '\n')
recent=$(echo "$recent" | sed 's|^file://||')

selected=$(echo "$recent" | rofi -theme ~/.config/rofi/launchers/type-1/style-8 -lines 7 -dmenu -i -p 'a' \
		-columns 1)

if [ -z "$selected" ]; then
  exit 1
fi
code "$selected"