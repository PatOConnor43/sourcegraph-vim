
function! sourcegraph#getRemote() abort
    return system('git remote | head -n 1')
endfunction

function! sourcegraph#getRemoteUrl() abort
    return system('git remote get-url ' . sourcegraph#getRemote())
endfunction

" Gets the current name of the branch we are working on. Returen 'HEAD'
" if in a detached state
function! sourcegraph#getBranch() abort
    return system('git rev-parse --abbrev-ref HEAD')
endfunction
