if exists('g:sourcegraph_vim_loaded')
    finish
endif
if !exists('g:sourcegraph_url')
    let g:sourcegraph_url = 'https://sourcegraph.com'
endif
let g:sourcegraph_vim_loaded = 1

