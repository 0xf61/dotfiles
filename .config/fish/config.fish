if status is-interactive
    bind \cl 'for i in (seq 1 (tput lines)); echo ""; end; commandline -f repaint'
    atuin init fish --disable-up-arrow | source
end
