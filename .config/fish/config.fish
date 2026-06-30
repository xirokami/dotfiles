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
alias n nvim
alias ns niri-session
alias q exit
alias cdir cd
alias cd z

alias ls lsd
alias l "ls -l"
alias la "l -a"

alias mkdir "mkdir -p"
alias mv "mv -i"

alias c cargo
alias cn "cargo +nightly"
alias zapret='sudo bash ~/Public/zapret-discord-youtube-linux/service.sh'
alias scw "systemctl start warp-svc.service && sleep 1 && warp-cli connect"

abbr sc systemctl
abbr scd systemctl disable
abbr sce systemctl enable
abbr scs systemctl start
abbr scst systemctl stop
abbr jc journalctl

abbr g git
abbr ga "git add"
abbr gac "git add . && git commit -m"
abbr gb "git branch"
abbr gch "git checkout"
abbr gc "git commit -m"
abbr gcl "git clone https://"
abbr gclg "git clone https://github.com/"
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

abbr w warp-cli
abbr wc warp-cli connect
abbr wd warp-cli disconnect
abbr ws warp-cli status

# Fix emoji and others rendering
set -g fish_emoji_width 2
set -g fish_cursor_insert line
set -g fish_cursor_replace_one underscore

# Vi key bindings
# set -g fish_key_bindings fish_vi_key_bindings

# Created by `pipx` on 2026-05-18 09:45:44
set PATH $PATH /home/xiro/.local/bin
