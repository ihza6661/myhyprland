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
