"Utility function to trim whitespace
function! sourcegraph#trim(in) abort
    return substitute(a:in, '\_s*$', '', '')
endfunction

"Gets the remote by returning the configured value or calling git
function! sourcegraph#getRemote() abort
    if exists('g:sourcegraph_vim_remote')
        return g:sourcegraph_vim_remote
    endif
        return sourcegraph#trim(system('git remote | head -n 1'))
endfunction

"Gets the url for the given remote
function! sourcegraph#getRemoteUrl() abort
    return sourcegraph#trim(system('git remote get-url ' . sourcegraph#getRemote()))
endfunction

" Gets the current name of the branch we are working on. Returen 'HEAD'
" if in a detached state
function! sourcegraph#getCommit() abort
    return sourcegraph#trim(system('git rev-parse HEAD'))
endfunction

" Builds the url given all the repository information
function! sourcegraph#buildUrl(remote_url, commit, relative_path, first, last) abort
    let l:host = split(split(a:remote_url, '@')[1], ':')[0]
    let l:user = split(split(a:remote_url, ':')[1], '/')[0]
    let l:repo = split(split(a:remote_url, '/')[1], '\.')[0]
    let l:line_anchor = '#L' . a:first
    if a:first != a:last
        let l:line_anchor = '#L' . a:first . '-L' . a:last
    endif

    return g:sourcegraph_vim_url . l:host . '/' . l:user . '/' . l:repo . '@' . a:commit . '/-/blob/' . a:relative_path . l:line_anchor
endfunction
