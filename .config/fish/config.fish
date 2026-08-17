set -l init_cache $HOME/.cache/fish/init
set -l brew_bin /opt/homebrew/bin/brew
if test -x $brew_bin; and not test $init_cache/brew.fish -nt $brew_bin
    mkdir -p $init_cache
    $brew_bin shellenv >$init_cache/brew.fish
end
test -f $init_cache/brew.fish; and source $init_cache/brew.fish

fish_add_path $HOME/.local/bin

if status is-interactive
    for tool in starship atuin iz
        set -l bin (command -v $tool)
        set -l out $init_cache/$tool.fish
        if test -n "$bin"; and not test $out -nt $bin
            mkdir -p $init_cache
            switch $tool
                case starship
                    starship init fish --print-full-init >$out
                case atuin
                    atuin init fish --disable-up-arrow >$out
                case iz
                    iz fish >$out
            end
        end
        test -f $out; and source $out
    end
end
