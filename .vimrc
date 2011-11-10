set number
set shellslash

if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif

set ambiwidth=double
set backspace=2
set tabstop=2
set shiftwidth=2
set expandtab

set ff=unix

set nobackup
set noswapfile

set hlsearch
set ignorecase

syntax on
filetype plugin on
filetyp  indent on

" シンタックスチェック機能
nmap ,l :call SyntaxCheck()<CR>
nmap ,e :call ExecuteCode()<CR>
nmap ,t :call ExecuteTest()<CR>

" print date time
nmap ,d :call ExecuteDate()<CR>

function SyntaxCheck()
  execute ":w"
  if ("php" == &filetype)
    echo system("php -l ".bufname(""))
  elseif ("ruby" == &filetype)
    echo system("ruby -c ".bufname(""))
  elseif ("yaml" == &filetype)
    echo system('ruby -ryaml -e "begin;YAML::load(open(\"'.bufname("").'\",\"r\").read); puts \"ok\"; rescue ArgumentError => e; puts e; end"')
  end
endfunction

function ExecuteCode()
  execute ":w"
  if ("php" == &filetype)
    execute ":! php %"
  elseif ("ruby" == &filetype)
    execute ":! ruby %"
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
