if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias nmail='nmail -d ~/.config/nmail'
alias vi='viu'
alias vimage='viu'
alias vm='glow -p'
alias vmarkdown='vm'
alias vp='termpdf.py'
alias vpdf='vp'
alias vv='mpv --vo=kitty'
alias vvideo='vv'
alias vw='rdrview -B lynx'
alias vwebsite='vw'
alias nnn='nnn -a -P p -c'
alias vrw='/home/agustin/.local/bin/view-reader-website'
set -g theme_color_scheme nord
set -g fish_prompt_pwd_dir_length 0
set -U fish_user_paths /home/agustin/.cargo/bin /home/agustin/.local/bin $fish_user_paths
setenv EDITOR vim
setenv NNN_OPENER /home/agustin/.config/nnn/plugins/nuke
setenv NNN_PLUG "p:preview-tui" 
