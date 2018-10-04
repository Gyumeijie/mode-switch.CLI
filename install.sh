#! /bin/bash

# echo $ZSH
# echo $ZSH_THEME
SUPPORTED_ZSH_THEME=$(find ./themes -type f)

for theme in $SUPPORTED_ZSH_THEME; do
   _theme=${theme##*/} # remove directory prefix
   theme_=${_theme%.*} # remove .zsh-theme suffix 
   if [ "$theme_" = "$ZSH_THEME" ]; then
      
      mv "$ZSH/themes/${_theme}" "$ZSH/themes/${_theme}.bak"
      cp "$theme"  "$ZSH/themes/${_theme}"
      dir="$ZSH/plugins/vi-mode" 
      if [ ! -d $dir ]; then 
         mkdir -p "$dir"
         mv "$dir/vi-mode.plugin.zsh" "$dir/vi-mode.plugin.zsh.bak" 2>/dev/null
      fi
      cp "./vi-mode.plugin.zsh" "$dir/vi-mode.plugin.zsh" 
fi 
done 

# add vi-mode plugin
sed -i '/^ *vi-mode/d' ~/.zshrc
sed -i 's/^plugins=(/plugins=(\n  vi-mode/' ~/.zshrc

echo "\n# vi-mode plugin" >> ~/.zshrc
echo "source $ZSH/plugins/vi-mode/vi-mode.plugin.zsh" >> ~/.zshrc

