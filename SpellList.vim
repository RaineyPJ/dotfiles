function AddWordToLocList()
        normal ye
        call setloclist(0,[{'bufnr': bufnr('%'), 'lnum': line('.'), 'col': col('.'), 'text': @0}],'a')
endfunction

function AddNextBadSpellToLocList()
        normal ]s
        call AddWordToLocList()
endfunction

function SpellList()
        call setloclist(0,[],'r')
        normal gg
        let l:lastLine = 0
        call AddNextBadSpellToLocList()
        let l:currentLine = line('.')
        " while line('.') >= l:lastLine
        let l:count = 0
        while line('.') >= l:lastLine
                let l:lastLine = line('.')
                call AddNextBadSpellToLocList()
                " echo l:currentLine
                let l:count = l:count + 1
                if l:count > 1000
                        throw "oops"
                endif
        endwhile
        lopen
endfunction

command SpellList call SpellList()
