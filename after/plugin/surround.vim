" vim-bepo - Plugin vim pour disposition de clavier bépo"
" Maintainer:       Clément Joly

" Require to set g:surround_no_mappings = 1 in your vimrc
if exists("g:loaded_surround") && g:loaded_surround && exists("g:surround_no_mappings") && g:surround_no_mappings
    " based on https://github.com/tpope/vim-surround/blob/f51a26d3710629d031806305b6c8727189cd1935/plugin/surround.vim#L599
    nmap dj  <Plug>Dsurround
    nmap dj  <Plug>Dsurround
    nmap lj  <Plug>Csurround
    nmap lJ  <Plug>CSurround
    nmap yj  <Plug>Ysurround
    nmap yJ  <Plug>YSurround
    nmap yjj <Plug>Yssurround
    nmap yJj <Plug>YSsurround
    nmap yJJ <Plug>YSsurround
    xmap J   <Plug>VSurround
    xmap gJ  <Plug>VgSurround
    if !exists("g:surround_no_insert_mappings") || ! g:surround_no_insert_mappings
        " if !hasmapto("<Plug>Isurround","i") && "" == mapchecj("<C-S>","i")
            " imap    <C-J> <Plug>Isurround
        " endif
        imap      <C-G>j <Plug>Isurround
        imap      <C-G>J <Plug>ISurround
    endif
endif
