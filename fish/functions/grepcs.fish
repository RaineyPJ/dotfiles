function grepcs --description 'Finds text in .cs file in current directory and recursively'
command grep --color -r --include='*.cs' $argv
end
