set number
set shellslash

if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif

set ambiwidth=double
set backspace=2
set expandtab

set ff=unix

set nobackup
set noswapfile

set hlsearch
set ignorecase

syntax on
filetype plugin on
filetyp  indent on

augroup filetypedetect
    au! BufRead,BufNewFile capfile,Capfile setfiletype ruby
augroup END

nmap ,l :call SyntaxCheck()<CR>
nmap ,e :call ExecuteCode()<CR>
nmap ,t :call ExecuteTest()<CR>

" print date time
nmap ,d :call ExecuteDate()<CR>

" change tab width
nmap ,4 :call Tab4()<CR>
nmap ,2 :call Tab2()<CR>

" change expandtab-noexpandtab
nmap ,- :call SetNoExpandTab()<CR>
nmap ,= :call SetExpandTab()<CR>

" change js code checker
nmap ,js :call ToggleJsCheker()<CR>

let g:jschecker = "nodelint"
function ToggleJsCheker()
    if ("nodelint" == g:jschecker)
        let g:jschecker = "jshint"
    elseif ("jshint" == g:jschecker)
        let g:jschecker = "jslint"
    elseif ("jslint" == g:jschecker)
        let g:jschecker = "nodelint"
    end

    echo "Change Js checker to"g:jschecker
endfunction

function SyntaxCheck()
  execute ":w"
  if ("php" == &filetype)
    echo system("php -l ".bufname(""))
  elseif ("ruby" == &filetype)
    echo system("ruby -c ".bufname(""))
  elseif ("yaml" == &filetype)
    echo system('ruby -ryaml -e "begin;YAML::load(open(\"'.bufname("").'\",\"r\").read); puts \"ok\"; rescue ArgumentError => e; puts e; end"')
  elseif ("javascript" == &filetype)
    echo system(g:jschecker." ".bufname(""))
  end
endfunction

function ExecuteCode()
  execute ":w"
  if ("php" == &filetype)
    execute ":! php %"
  elseif ("ruby" == &filetype)
    execute ":! ruby %"
  elseif ("javascript" == &filetype)
    execute ":! node %"
  end
endfunction

function ExecuteTest()
  execute ":w"
  if ("php" == &filetype)
    execute ":! phpunit --colors %"
  end
endfunction

function ExecuteDate()
  execute ":r! date"
endfunction

function Tab4()
  set tabstop=4
  set shiftwidth=4
endfunction

function Tab2()
  set tabstop=2
  set shiftwidth=2
endfunction

function SetNoExpandTab()
  set noexpandtab
endfunction

function SetExpandTab()
  set expandtab
endfunction

call Tab4()
call SetExpandTab()

" space可視化の呪文 (via: http://d.hatena.ne.jp/potappo2/20061107/1162862536)
syntax match InvisibleJISX0208Space "　" display containedin=ALL
highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=Blue
syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=Red
syntax match InvisibleTab "\t" display containedin=ALL
highlight InvisibleTab term=underline ctermbg=Cyan guibg=Cyan

if has("syntax")
    syntax on
    function! ActivateInvisibleIndicator()
        syntax match InvisibleJISX0208Space "　" display containedin=ALL
        highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=Blue
        syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
        highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=Red
        syntax match InvisibleTab "\t" display containedin=ALL
        highlight InvisibleTab term=underline ctermbg=Cyan guibg=Cyan
    endf

    augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
    augroup END
endif
