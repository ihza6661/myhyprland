# ~/.config/fish/config.fish

# --- mise ---
if type -q mise
    mise activate fish | source
end

# --- starship ---
if type -q starship
    starship init fish | source
end

# --- zoxide ---
if type -q zoxide
    zoxide init fish | source
end

# --- fzf ---
if type -q fzf
    if test -f /usr/share/fzf/key-bindings.fish
        source /usr/share/fzf/key-bindings.fish
    end

    if test -f /usr/share/fzf/completion.fish
        source /usr/share/fzf/completion.fish
    end
end

# --- opencode ---
set -g -a fish_user_paths "$HOME/.opencode/bin"

# --- local bin ---
set -g -a fish_user_paths "$HOME/.local/bin"

# --- agy alias ---
alias agy="agy --dangerously-skip-permissions"
fish_add_path /home/ihzabaker/.spicetify

# --- yt-dlp music aliases ---
alias ytdl-mp3="yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --embed-metadata -o \"%(title)s.%(ext)s\""
alias ytdl-music="yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --embed-metadata -P ~/Music -o \"%(title)s.%(ext)s\""
alias ytdl-playlist="yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --embed-metadata -P ~/Music -o \"%(playlist_title)s/%(title)s.%(ext)s\""

