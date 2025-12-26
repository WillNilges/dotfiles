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

### Installed LSPs

```
Installed Press U to update 3 packages (gopls, lua-language-server, rust-analyzer) (8)
  ◍ helm-ls helm_ls (keywords: helm)
  ◍ glsl_analyzer (keywords: opengl)
  ◍ gopls (keywords: go)     ■ new version available: v0.20.0 -> v0.21.0
  ◍ jdtls (keywords: java)
  ◍ lua-language-server lua_ls (keywords: lua)     ■ new version available: 3.15.0 -> 3.16.3
  ◍ pyright (keywords: python)
  ◍ rust-analyzer rust_analyzer (keywords: rust)     ■ new version available: 2025-11-10 -> 2025-12-22
  ◍ stylua (keywords: lua, luau)
```
