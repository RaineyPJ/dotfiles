function InsertTable(N)
        let l:emptyCell = "    |"
        let l:headerBar = " -- |"
        let l:empltyline = "|"
        let l:barline = "|"
        for i in range(a:N)
                let l:empltyline = l:empltyline .. l:emptyCell
                let l:barline = l:barline .. l:headerBar
        endfor
        call append(line('.'),l:empltyline)
        call append(line('.'),l:barline)
        call append(line('.'),l:empltyline)
endfunction

command -nargs=1 InsertTable call InsertTable(<f-args>)
