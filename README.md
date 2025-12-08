`source-file ~/.tmux.conf`

### ZSH themes I like
- refined
- wilnil-filing-cabinet
- wilnil-lowkey
- mrtazz

### xkb
you can put something like this into
/etc/X11/xorg.conf.d/00-keyboard.conf

```
setxkbmap -option caps:swapescape
setxkbmap -option compose:ralt
```
Like so
```
# Written by systemd-localed(8), read by systemd-localed and Xorg. It's
# probably wise not to edit this file manually. Use localectl(1) to
# instruct systemd-localed to update it.
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "us"
        Option "XkbModel" "pc105+inet"
        Option "XkbOptions" "terminate:ctrl_alt_bksp"
        Option "XkbOptions" "caps:swapescape"
        Option "XkbOptions" "compose:ralt"
EndSection
```
