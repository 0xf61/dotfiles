if status is-interactive
    atuin init fish --disable-up-arrow | source
end

if type -q starship
    starship init fish | source
end
