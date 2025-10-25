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

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export GOPATH "$HOME/go"
set --export PATH $BUN_INSTALL/bin $GOPATH/bin $HOME/.local/bin $PATH

# void
set --export XBPS_DISTDIR "$HOME/.void-packages"

# gpg
export GPG_TTY=$(tty)

# other
set -gx EDITOR "nvim"

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

# alias
alias ll "eza -lha --icons=auto --sort=name --group-directories-first"
