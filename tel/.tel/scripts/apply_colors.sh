#!/usr/bin/env bash
# this file will be replaced with each update so modifications are not recommended here
source ~/.tel/theme/active/colors.sh # source theme cols

#source ~/.cache/wal/colors.sh # source theme cols
# tel keyboard colors
#sed -i '/keyboard-color/d' ~/.tel/configs/theme.conf #remove existing line from config
#sed -i '/keyboard-text-color/d' ~/.tel/configs/theme.conf #remove existing line from config
#sed -i '/keyboard-selected-color/d' ~/.tel/configs/theme.conf #remove existing line from config
#echo -e "keyboard-color=$background" >> ~/.tel/configs/theme.conf # add color to value and back into file
#echo -e "keyboard-text-color=$foreground" >> ~/.tel/configs/theme.conf # add color to value and back into file
#echo -e "keyboard-selected-color=$cursor" >> ~/.tel/configs/theme.conf # add color to value and back into file

if [ ! -z "$1" ] ; then
	alpha=$1
	backgroundalpha="#$alpha${background:1:6}"
else
	backgroundalpha="#99${background:1:6}"
fi

# tel status modules colors
sed -i '/status-text-color/d' ~/.tel/configs/theme.conf #remove existing line from config
echo -e "status-text-color=$foreground" >> ~/.tel/configs/theme.conf # add color to value and back into file

# tel bg color - requires alpha channel for transparency
sed -i '/background-color/d' ~/.tel/configs/theme.conf #remove existing line from config
echo -e "background-color=$backgroundalpha" >> ~/.tel/configs/theme.conf # add color to value and back into file

# tel statusbar + termux bar bg color - requires alpha channel for transparency
sed -i '/bar-color/d' ~/.tel/configs/theme.conf #remove BOTH existing lines from config
backgroundalpha="#99${background:1:6}"
baralpha="#FF${background:1:6}" # termux and suggestion bar background col
echo -e "statusbar-color=$backgroundalpha" >> ~/.tel/configs/theme.conf # add color to value and back into file
echo -e "bar-color=$baralpha" >> ~/.tel/configs/theme.conf # add color to value and back into file


# TEL keyboard #color10 also works but may require brightness reduction
am broadcast --user 0 --es theme 4 --es color "$background" -a com.tel.keyboard.inputmethod.THEME com.tel.keyboard.inputmethod > /dev/null 2>&1

# termux colors
termux_color_file=~/.termux/colors.properties
temp_color_file=~/.termux/colors.temp
touch $temp_color_file
echo "# Generated by tel-theme #" >> $temp_color_file
echo background="$background" >> $temp_color_file
echo foreground="$foreground" >> $temp_color_file
echo cursor="$cursor" >> $temp_color_file

echo color0="$color0" >> $temp_color_file
echo color1="$color1" >> $temp_color_file
echo color2="$color2" >> $temp_color_file
echo color3="$color3" >> $temp_color_file
echo color4="$color4" >> $temp_color_file
echo color5="$color5" >> $temp_color_file
echo color6="$color6" >> $temp_color_file
echo color7="$color7" >> $temp_color_file
echo color8="$color8" >> $temp_color_file
echo color9="$color9" >> $temp_color_file
echo color10="$color10" >> $temp_color_file
echo color11="$color11" >> $temp_color_file
echo color12="$color12" >> $temp_color_file
echo color13="$color13" >> $temp_color_file
echo color14="$color14" >> $temp_color_file
echo color15="$color15" >> $temp_color_file

mv -f $termux_color_file ~/.termux/colors.properties.bak
mv -f $temp_color_file $termux_color_file 
exit 0
