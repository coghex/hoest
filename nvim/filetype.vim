if exists ("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.vert setfiletype vert
    au! BufRead,BufNewFile *.frag setfiletype frag
augroup END

