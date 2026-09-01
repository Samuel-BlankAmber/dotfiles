# patches

Local changes to things that can't be tracked directly.

## tmux-assistant-resurrect-speedup.patch

The plugin is installed by tpm so it's a git repo of its own. These edits cut
session restore from ~30s to ~6s by shortening the fixed sleeps and the
client-wait timeout. tpm reverts them on update. To re-apply:

    cd ~/.config/tmux/plugins/tmux-assistant-resurrect/scripts
    patch -p0 < ~/dotfiles/patches/tmux-assistant-resurrect-speedup.patch
