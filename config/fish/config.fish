function start_wm
    echo "Quel WM lancer ?"
    echo "- 0 TTY"
    echo "- 1 Sway"
    echo "- 2 niri"
    while read --nchars 1 -l response
            or return 1 # if the read was aborted with ctrl-c/ctrl-d
        switch $response
            case 0
                break
            case 1 
                dbus-run-session -- sway
                sudo poweroff
                break
            case 2
                dbus-run-session -- niri --session 
                sudo poweroff
                break
            case '*'
                echo Invalid input
                continue
        end
    end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    if tty | string match "/dev/tty1"
	    start_wm
    end
end

# custom path 
set --export BUN_INSTALL "$HOME/.bun"
set --export GOPATH "$HOME/go"
set --export PATH $BUN_INSTALL/bin $GOPATH/bin $HOME/.local/bin $PATH

# void
set --export XBPS_DISTDIR "$HOME/.void-packages"

# gpg
export GPG_TTY=$(tty)

# other
set -gx EDITOR "nvim"
set -gx PAGER "bat"
set -gx MANPAGER "bat -l man -p"

# fzf

## open in nvim with <C-o>
set -x fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

## fix theme
function apply_theme --on-variable fish_terminal_color_theme
    switch $fish_terminal_color_theme
        case "light" 
            set -gx BAT_THEME "Catppuccin Latte"
            set_theme_light
        case "dark" 
            set -gx BAT_THEME "Catppuccin Macchiato"
            set_theme_dark
    end
end

## fix display
set -x fzf_diff_highlighter delta --config "$HOME/.config/fish/delta.toml"

## custom bindings
fzf_configure_bindings --directory=\cf --git_log=\cg --git_status=\cs

# yazi
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# prefer 256 palettes
set -g fish_term24bit 0

# alias
alias ll "eza -lh --icons=auto --sort=name --group-directories-first"
alias lla "eza -lha --icons=auto --sort=name --group-directories-first"
alias rg "rg -C 3"

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/anhgelus/.ghcup/bin $PATH # ghcup-env