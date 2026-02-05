function pick_multi_session
    set -l sessions_with_br (string match -r ".* \[" $(zellij ls))
    set -l sessions (string sub -e -2 $sessions_with_br)
    set -l no_color (string replace -ra '\e\[[^m]*m' '' $sessions)
    set -l selected $(string join -- \n $no_color | fzf --separator=\n)
    if string length -q $selected
        zellij a "$selected"
    end
end
