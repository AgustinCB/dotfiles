if status is-interactive
    # Commands to run in interactive sessions can go here
end
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
set -g theme_color_scheme nord
set -g fish_prompt_pwd_dir_length 0
setenv EDITOR vim
setenv NNN_OPENER /home/agustin/.config/nnn/plugins/nuke
setenv NNN_PLUG "p:preview-tui" 
