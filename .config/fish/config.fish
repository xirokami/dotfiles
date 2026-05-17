set -g fish_greeting ''
set -gx EDITOR nvim

zoxide init fish | source
starship init fish | source

function spf
    set spf_last_dir "$HOME/.local/state/superfile/lastdir"
    command spf $argv
    if test -f "$spf_last_dir"
        source "$spf_last_dir"
        rm -f -- "$spf_last_dir" >>/dev/null
    end
end

alias n 'fg || nvim'
alias ns niri-session
alias q exit

alias ls lsd
alias l "ls -l"
alias la "l -a"

alias mkdir "mkdir -p"
alias mv "mv -i"

alias c cargo
alias cn "cargo +nightly"
alias zapret='sudo bash ~/Public/zapret/zapret-discord-youtube-linux/service.sh'

abbr sc systemctl
abbr jc journalctl

abbr g git
abbr ga "git add"
abbr gb "git branch"
abbr gch "git checkout"
abbr gc "git commit -m"
abbr gd "git diff"
abbr gf "git fetch"
abbr gl "git log"
abbr gm "git merge"
abbr gpull "git pull"
abbr gpush "git push"
abbr gr "git rebase"
abbr grm "git remote"
abbr gs "git status"
abbr gsh "git show"
abbr gst "git stash"

# Fix emoji and others rendering
set -g fish_emoji_width 2
set -g fish_cursor_insert line
set -g fish_cursor_replace_one underscore

# Vi key bindings
# set -g fish_key_bindings fish_vi_key_bindings
