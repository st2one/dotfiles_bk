#!/bin/sh

# if battery_info=$(/usr/bin/pmset -g ps | awk '{ if (NR == 2) print $2 " " $3 }' | sed -e "s/;//g" -e "s/%//") ; then
#   battery_quantity=$(echo $battery_info | awk '{print $2}')
#   if [[ ! $battery_info =~ "discharging" ]]; then
#     battery="#[bg=cyan,fg=black] ⚡︎$battery_quantity% #[default]"
#   elif (( $battery_quantity < 16 )); then
#     battery="#[bg=red,fg=white] $battery_quantity% #[default]"
#   else
#     battery="#[bg=cyan,fg=black] $battery_quantity% #[default]"
#   fi
#   echo $battery
# fi

if battery_info=$(/usr/bin/pmset -g ps | awk '{ if (NR == 2) print $3 " " $4 }' | sed -e "s/;//g" -e "s/%//") ; then
  if [[ -n $battery_info ]]; then
    local battery_quantity
    local battery
    battery_quantity=" $(echo $battery_info | awk '{print $1}')"
    if (( $battery_quantity < 16 )); then
      battery="#[bg=colour124,fg=white]$battery_quantity% #[default]"
    else
      battery="#[bg=colour106,fg=black]$battery_quantity% #[default]"
    fi
  fi
  echo $battery
fi
