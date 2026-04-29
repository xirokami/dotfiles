if status is-interactive
    set -g fish_greeting ''
    alias n='nvim'
    alias ls='lsd'
    alias l='lsd -l'
    alias la='lsd -A'
    alias lla='lsd -la'
    alias lt='lsd --tree'
    alias zapret='sudo bash ~/Public/zapret/zapret-discord-youtube-linux/service.sh'
    zoxide init fish | source
    starship init fish | source
end

function spf
    set os $(uname -s)

    if test "$os" = Linux
        set spf_last_dir "$HOME/.local/state/superfile/lastdir"
    end

    if test "$os" = Darwin
        set spf_last_dir "$HOME/Library/Application Support/superfile/lastdir"
    end

    command spf $argv

    if test -f "$spf_last_dir"
        source "$spf_last_dir"
        rm -f -- "$spf_last_dir" >>/dev/null
    end
end
