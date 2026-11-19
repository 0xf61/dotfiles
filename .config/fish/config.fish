if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
else if test -x /home/linuxbrew/.linuxbrew/bin/brew
    /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
end

fish_add_path $HOME/.local/bin

if status is-interactive
    type -q starship; and starship init fish | source
    type -q atuin; and atuin init fish --disable-up-arrow | source
    type -q iz; and iz fish | source
end
