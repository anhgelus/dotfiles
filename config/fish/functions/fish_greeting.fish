function fish_greeting
    if not set -q fish_greeting
        set -l line1 (printf (_ 'Welcome to %sanhgelus-void%s.') (set_color "#95d5b2" green) (set_color normal))
        set -l line2 \n(printf (_ 'Workstation powered by the %svoid%s.') (set_color green) (set_color normal))
        set -g fish_greeting "$line1$line2"
    end

    if set -q fish_private_mode
        set -l line (_ "fish is running in private mode, history will not be persisted.")
        if set -q fish_greeting[1]
            set -g fish_greeting $fish_greeting\n$line
        else
            set -g fish_greeting $line
        end
    end

    # The greeting used to be skipped when fish_greeting was empty (not just undefined)
    # Keep it that way to not print superfluous newlines on old configuration
    test -n "$fish_greeting"
    and echo $fish_greeting
end
