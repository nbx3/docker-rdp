xautolock -locker ~/bin/locker -time 3 &
pgrep tint2 || tint2 & # bar
pgrep dunst || dunst & # notifications
