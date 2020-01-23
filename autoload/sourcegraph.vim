
function! sourcegraph#getRemote() abort
    return 'upstream'
    "return system('git remote | head -n 1')
endfunction

function! sourcegraph#getRemoteUrl() abort
    return system('git remote get-url ' . sourcegraph#getRemote())
endfunction

" Gets the current name of the branch we are working on. Returen 'HEAD'
" if in a detached state
function! sourcegraph#getCommit() abort
    return system('git rev-parse HEAD')
endfunction

function! sourcegraph#buildUrl(remote_url, commit, relative_path) abort
    let g:host = split(split(a:remote_url, '@')[1], ':')[0]
    let g:user = split(split(a:remote_url, ':')[1], '/')[0]
    let g:repo = split(split(a:remote_url, '/')[1], '\.')[0]
    echo g:host
	echo g:user
	echo g:repo
    echo a:relative_path
    return g:sourcegraph_url . g:host . '/' . g:user . '/' . g:repo . '@' . a:commit . '/-/blob/' . a:relative_path . '#L1'
endfunction
