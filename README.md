# dotfiles

Sway setup for Ubuntu, managed with stow. Each top-level dir is a stow package
mirroring the path under $HOME, so `sway/.config/sway/config` links to
`~/.config/sway/config`.

## Setup

    sudo apt install -y stow
    git clone <remote> ~/dotfiles
    cd ~/dotfiles && stow sway waybar foot fuzzel mako tmux bin systemd zsh git

## Scripts in bin/

    wifi-menu           nmcli picker via fuzzel, wired to the waybar network module
    bt-menu             bluetooth picker via fuzzel, wired to the waybar bt module
    voice-input         $mod+x dictation: pw-record + faster-whisper + wtype
    battery-alert       low battery warnings, run by the systemd timer
    move-workspace-to   reorder workspaces by renumbering ($mod+Ctrl+N)
    fork-claude-tmux    fork a Claude session into a new tmux session
    tmux-restore        restore tmux sessions at login

## Caveats

waybar/config.jsonc and the systemd units use absolute /home/sam paths.
