if exists("g:loaded_myplugin")
     finish
endif

let g:loaded_myplugin = 1

function! myplugin#test()

    " Saving global variables for modification
    let s:save_virtualedit = &virtualedit
    set virtualedit=all
    echo &virtualedit
    let &virtualedit = s:save_virtualedit
    unlet s:save_virtualedit
    
    " Inserting lines into a file
    call append(0, "---------")

    " Reading file in
    for line in readfile(fname, '', 10)
      if line =~ 'Date' | echo line | endif
    endfor

    " Draw ASCI with function
    call myplugin#DrawASCI("-", 20, "hor")

    " Step into ex mode and execute the "new" command
    exe "new"

    let s:header1 = "+----------+------------+-----------+\n"
    let s:header2 = "|          |            |           |\n"
    call myplugin#DrawString(s:header1 . s:header2)

endfunction

function! myplugin#DrawASCI(char, num, orientation)
    if a:orientation == "hor"
        exe "normal!".a:num."i".a:char
    endif
    " else TODO add vertical draw
endfunction

function! myplugin#DrawString(stringToDraw)
    exe "normal!i".a:stringToDraw
endfunction

