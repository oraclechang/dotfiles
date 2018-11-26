# Defined in - @ line 0
function vi --description 'alias vi vim (fzf)'
    if count $argv > /dev/null
        vim $argv
    else
        vim (fzf)
    end
end
# https://stackoverflow.com/questions/29635083/fish-shell-check-if-argument-is-provided-for-function
