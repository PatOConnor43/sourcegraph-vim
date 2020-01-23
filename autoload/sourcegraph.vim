
function! sourcegraph_vim#getRemote() abort
    return system('git remote | head -n 1')
endfunction

function! sourcegraph_vim#getRemoteUrl() abort
    return system('git remote get-url ' . sourcegraph_vim#getRemote())
endfunction

" Gets the current name of the branch we are working on. Returen 'HEAD'
" if in a detached state
function! sourcegraph_vim#getBranch() abort
    return system('git rev-parse --abbrev-ref HEAD')
endfunction
