# Defined interactively
function fish_prompt
    switch "$fish_key_bindings"
        case fish_hybrid_key_bindings fish_vi_key_bindings
            set STARSHIP_KEYMAP "$fish_bind_mode"
        case '*'
            set STARSHIP_KEYMAP insert
    end
    set STARSHIP_CMD_STATUS $status
    # Account for changes in variable name between v2.7 and v3.0
    set STARSHIP_DURATION "$CMD_DURATION$cmd_duration"
    "/usr/bin/starship" prompt --status=$STARSHIP_CMD_STATUS --keymap=$STARSHIP_KEYMAP --cmd-duration=$STARSHIP_DURATION --jobs=(count (jobs -p))
end
# https://github.com/Cyber-Duck/fish-wakatime/blob/master/fish-wakatime.sh
set -l project

if echo (pwd) | grep -qEi "^/Users/$USER/Documents/Development/"
    set  project (echo (pwd) | sed "s#^/Users/$USER/Documents/Development/\\([^/]*\\).*#\\1#")
else
    set  project "Terminal"
end

wakatime --write --plugin "fish-wakatime/0.0.1" --entity-type app --project "$project" --entity (echo $history[1] | cut -d ' ' -f1) 2>&1 > /dev/null&