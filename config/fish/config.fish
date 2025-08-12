if status is-interactive
    # Commands to run in interactive sessions can go here
    if tty | string match "/dev/tty1"
	    $HOME/start
    end
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export GOPATH "$HOME/go"
set --export PATH $BUN_INSTALL/bin $GOPATH/bin $HOME/.local/bin $PATH

# gpg
export GPG_TTY=$(tty)
