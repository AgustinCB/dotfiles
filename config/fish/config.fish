if status is-interactive
    # Commands to run in interactive sessions can go here
end
alias vw='rdrview -B lynx'
alias vm='glow -p'
alias vp='termpdf.py'
alias nnn='nnn -a -P p -c'
set -g theme_color_scheme nord
set -g fish_prompt_pwd_dir_length 0
setenv EDITOR vim
setenv NNN_OPENER /home/agustin/.config/nnn/plugins/nuke
setenv NNN_PLUG "p:preview-tui" 
