function pick_multi_session
    set -l sessions $(zellij ls -ns)
    set -l selected $(string join -- \n $sessions | fzf --separator=\n)
    if string length -q $selected
        zellij a "$selected"
    end
end
