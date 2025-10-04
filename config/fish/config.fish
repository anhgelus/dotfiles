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
                break
            case 2
                dbus-run-session -- niri --session 
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
