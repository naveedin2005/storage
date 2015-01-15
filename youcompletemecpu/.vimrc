set clipboard=unnamed
set nocompatible " Use vim settings
set modelines=0	" Prevent security hole

" All tabs are 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" General Settings
set visualbell                  " No bell
set t_vb=                       " No bell
set encoding=utf-8
set scrolloff=3                 " Allow text to scroll to center view when it's at the bottom of the document
set autoindent
set showmode
set showcmd                     " Show incomplete commands
set hidden                      " Open new file without being forced so save open buffer
set wildmenu
set wildmode=list:longest
" Ignore file types in autocomplete
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.obj,.DS_Store,*.jpg,*.d,*.dia,*.imageset,*.png,*.ai,*/Pods/*,*.xcworkspace,*.xcodeproj,*/tmp/*,*.lock,*/xcodebuild/*,*.orig,*.ropeproject
" set cursorline
" set ttyfast
set ruler                       " Show cursor position info in a line at the bottom
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
"set laststatus=2               " Show a black band at the bottom with ?
"set relativenumber             " Show relative line numbers rather than absolute
set undofile                    " Preserve undo information between sessions
"au FocusLost * :wa             " Save the current buffer when the window is no longer in focus
let mapleader = "\<Space>"             " Set <leader> to ,
set textwidth=0
set formatoptions-=tc
set autoread                    " Automatically read from file whenever it's changed on disk
" TODO: Map something with the option meta key:
" :nnoremap <silent>∆ :set paste<CR>m`o<Esc>`:set nopaste<CR>`

" Custom Commands
" Clean up all trailing whitespace in the file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" Open .vimrc in a vertically split window
" TODO: Make this open in horizontal window if there is more horizontal space
" than vertical, make it open in vertical space if there is more vertical than
" horizontal space available to vim
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" Reload .vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" Open a new vertical split window and switch to it
nnoremap <leader>w <C-w>v<C-w>l
" Show all yanks with YankRing
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>
set pastetoggle=<F2>                                " Toggle paste mode to disable syntax changes to content that's pasted iv
" Go backward in jumplist
nnoremap <C-a> <C-i>
" Use 0 to juuump to the firsttt non-whitespace character on the line and ^ to go to the beginning of the line
nnoremap 0 ^
nnoremap ^ 0
" When accidently typing :q out of order, do what's expected rather than showing a list of commands I may have been thinking of
map q: :q

" Save a file that requires sudo privelage after you opened it
cmap w!! w !sudo tee % >/dev/null

" Search Settings
nnoremap / /\v
vnoremap / /\v
set ignorecase                      " Ignore case if all character in search string are lowercase
set smartcase                       " Case-sensitive search if at least one character is uppercase
set gdefault                        " By default, replace all occurences of a word on the line
" Highlight search results while typing
set incsearch
set showmatch
set hlsearch
" Remove search highlights with <leader><space>
nnoremap <leader><space> :noh<cr>
" Tab key matches bracket pairs
nnoremap <tab> %
vnoremap <tab> %
" Use semi-colon as colon key
nnoremap ; :

"These are to cancel the default behavior of d, D, c, C
"  to put the text they delete in the default register.
"  Note that this means e.g. "ad won't copy the text into
"  register a anymore.  You have to explicitly yank it.
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
nnoremap x "_x
vnoremap x "_x

vmap r "_dP       // Replace the selected text with what's in the yank register

" vim training
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" File to keep all of my debugging tips, reminders, and checlist for myself
:command! Bug :e ~/Dropbox/dev/docs/bug-todo.md

" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'                   " vim package manager
Plugin 'tpope/vim-fugitive'                  " git wrapper
Plugin 'kovisoft/slimv'                      " LISP
Plugin 'scrooloose/nerdcommenter'            " Commenting shortcuts
Plugin 'scrooloose/nerdtree'                 " File system explorer
Plugin 'mileszs/ack.vim'                     " ack support for searching files
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'                  " default snippets for ultisnips
Plugin 'kien/rainbow_parentheses.vim'        " parentheses pretty highlighting
Plugin 'tpope/vim-unimpaired'                " Keyboard shortcut to jump to next git conflict
Plugin 'vim-scripts/vim-auto-save'           " Auto save
Plugin 'nathanaelkane/vim-indent-guides'     " Pretty lines to follow the begnning and end of code blocks
Plugin 'altercation/vim-colors-solarized'    " Color scheme
Plugin 'Raimondi/delimitMate'                " Automatically insert closing brackets
Plugin 'xolox/vim-misc'                      " Dependency for vim-easy-tags
Plugin 'tpope/vim-surround'                  " Add, remove, and change surrounding characters in pairs
"Plugin 'powerline/powerline'                 " Feature rich status bar
"Plugin 'tpope/vim-endwise'                   " Wisely add endings like endif, endfunction, etc..
"Plugin 'thomasgubler/vim-gitignore'          " Respect .gitignore in vim's wildignore
" Plugin 'jaxbot/semantic-highlight.vim'       " Highlight each variable a different color
" Plugin 'YankRing.vim'                   " Yank history
" NerdTree = File browser
" vim-repeat = a . function that repeats an entire macro rather than the last
" command only
" Documentation search: https://github.com/Keithbsmiley/investigate.vim

" tmux
Plugin 'christoomey/vim-tmux-navigator'      " Navigate tmux panes and windows like vim splist
Plugin 'benmills/vimux'                      " vim + tmux convenience commands
Plugin 'xolox/vim-session'                   " Save and restore vim state
Plugin 'tmux-plugins/vim-tmux'               " Proper syntax highlighting and editing of tmux.conf

" Python
Plugin 'klen/python-mode'                    " linters, run code, debug, etc.

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Xcode functionality
Plugin 'kien/ctrlp.vim'                      " quick search bar
Plugin 'b4winckler/vim-objc'                 " Better Obj-C indenting
Plugin 'SirVer/ultisnips'                    " code snippets
Plugin 'eraserhd/vim-ios'                    " .h <-> .m switching and project build
" cocoa.vim is causing me a very serious slowdown.  Why?
"Plugin 'kentaroi/cocoa.vim'
"Plugin 'zenangst/cocoa.vim'                  " method list, documentation, fixes the incorrect block bracket error
"Plugin 'alexdunn/YouCompleteMe'              " Dev code completion
Plugin 'Valloric/YouCompleteMe'              " code completion
"Plugin 'alexdunn/vim-autoformat'             " Test auto-formatting
Plugin 'Chiel92/vim-autoformat'              " Auto-format code using existing formatters
Plugin 'qstrahl/vim-matchmaker'              " Highlight the term under the cursor
Plugin 'xolox/vim-easytags'                  " Automatically update exuberant ctags for syntax highlighting of user-defined variables
" Consider Plugin 'tpope/vim-dispatch' for kicking off asynchronous
" build/run/etc in a tmux window
call vundle#end()
filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

"vim-surround
" NOTE: we explicitly set a temporary marker (z) and restore
"       it after the surround operation because otherwise the
"       surround plugin will move the cursor to the opening
"       quote of the operand after the operation, instead of
"       keeping the cursor where it was before the operation
"
nmap <Leader>' mzcs"'`z
nmap <Leader>" mzcs'"`z
nmap <Leader>r mzyssr`z     " Surround the current line with [] and return to the original cursor position

" python-mode
let g:pymode_lint = 1                " Enable linter
let g:pymode_lint_on_write = 1       " Check with linter on save
let g:pymode_lint_checkers = ['pylink', 'pyflakes', 'pep8', 'mccabe']
let g:ctrlp_working_path_mode = 'r'  " Always use the current working directory rather than the location of the current file

" ctrlp
" Search through ctags
nnoremap <leader>. :CtrlPTag<cr>
" Make ctrlp a lot faster in git repositories
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

" vim-autoformat
" Autoformat on file save
autocmd FileType objc,objcpp autocmd BufWritePre <buffer> :silent Autoformat
"map <C-K> :pyf ~/Dropbox/dev/clang-format.py<cr>
"imap <C-K> <c-o>:pyf ~/Dropbox/dev/clang-format.py<cr>

" vim-session
let g:session_directory = getcwd()      " The session directory is always the current directory.  This should allow save and restory on a per project basis
let g:session_lock_directory = '/var/tmp'   " Store the lock files locally so that I don't lock my session from a remote computer for files that are in Dropbox
let g:session_default_name = ".vim-session"
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'

" fugitive
set statusline+=%{fugitive#statusline()}

" vim-objc
"let c_no_curly_error = 1    " Don't show syntax errors on closing brackets of blocks

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
nnoremap <leader>d :YcmCompleter GoToDefinition <cr>
nnoremap <leader>s :YcmCompleter GoToDeclaration <cr>
:command! Errors :YcmDiag
"let g:ycm_confirm_extra_conf = 0
" Don't show the window at the top with additional completion information
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
" Close the window at the top that appears with additional completion
" information
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
function! SetErrorsAndWarnings() " Only show the errors and warnings gutter if it's a file that I wrote
    let currentFilePath = expand('%:p')
    if currentFilePath =~ '/Dropbox/dev/'
        let g:ycm_show_diagnostics_ui = 1
    else
        let g:ycm_show_diagnostics_ui = 0
    endif
endfunction
" Execute the function before the file is opened so that it can be turned off
" in time for files that are be opened
autocmd BufRead * call SetErrorsAndWarnings()
" Execute it on entering a buffer so that it can be turned on for files that
" were already read
autocmd BufEnter * call SetErrorsAndWarnings()
"let g:ycm_semantic_triggers =  {
"  \   'objc' : ['?', 're![_a-zA-Z]+'],
"  \ }

" vim-auto-save
let g:auto_save = 1                 " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
let g:auto_save_silent = 1          " do not display the auto-save notification

" Always load Rainbow Parentheses
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
"let g:lisp_rainbow=1                    "Lisp rainbow parentheses

" Ack
" Search all files in and under the current diretory using :S <string>
:command! -nargs=+ S :Ack! "<args>"
" Search all C files
:command! -nargs=+ SC :Ack! --cpp "<args>"

" UltiSnips
"The below key bindings are compatible with YouCompletMe integration
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Auto-reload vimrc on file save of .vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" History
set nobackup		" prevent the ~ backup files from appearing on the filesystem
set history=500		" keep 50 lines of command line history
set undolevels=500
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

syntax enable                       " Enable syntax highlighting

if has ("gui_running")
    set background=dark
    colorscheme solarized
    set guicursor+=n-v-c:blinkon0   " Disable cursor blinking
    set guioptions+=c               " Don't show GUI windows
    set guioptions-=r               " Don't show right-hand scrollbar
    set guioptions-=L               " Don't show left-hand scrollbar
else
    set background=dark
    colorscheme solarized
    highlight SignColumn ctermbg=None
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Custom Autocommands
" :help autocmd-events

" Set the title of the Terminal to the currently open file
function! SetTerminalTitle()
    let titleString = expand('%:t')
    if len(titleString) > 0
        let &titlestring = expand('%:t')
        set title
    endif
endfunction
autocmd BufEnter * call SetTerminalTitle()

" Use bash as the the external shell
"set shell=bash\ --login
"set shellcmdflag=-ic    " :! commands will now occur in interactive shell (bash)

" tmux questions
" How do I scroll through the bash history?
" I need to reconcile vim's Ctrl B with tmux's Ctrl B
" How do I search through bash history in tmux?
" Reconcile the system pasteboard on remote tmux sessions

" TODO:
" Priorities
" 1. YouCompleteMe full ObjC method name completions don't complete sometimes
" https://github.com/Valloric/YouCompleteMe/issues/1221
" 2. Expand the YouCompleteMe regexps so that they correctly begin in these
" situations:
" NSFileManager defaultManager          That is, no beginning or ending []
" [NSFileManager defaultManager] copyItem       That is, adding a method onto
" a complete call
" [[NSFileManager defaultManager] copyItem      That is, With correct beginning
" bracket, no ending bracket
" https://github.com/Valloric/ycmd/commit/6b45487158e539245585a8041a9cf00543ad18e3
" 3. List and manipulate project targets as part of being able to build,
" install, run, debug, test, and analyze specific targets under specific
" configurations for specific devices
" 4. Color those things you want colored in Objective-C code
" 5. Color use-defined words (easy-tags ObjC support)
" 6. Improve YouCompleteMe performance.  Disable the gutter? Fork it and make
" it a NeoVim plugin with concurrency?
" - Search only method/function names in project - Use ctags
" - Automate the creation of the -I and -F strings for the YouCompleteMe config file for semantic ObjC completion
"    ack --cc '\ ((?:\-I|\-F)[0-9a-zA-Z_\/.-^(DerivedData)]+)' --output ''\''$1'\'',' ~/Desktop/build.txt | sort -u
"    gfind /Users/admin/Dropbox/dev/objc/memories/LearningApp -name *.h -o -name *.m -printf ''\''-I%h'\'',\n' | sort -u
" xcodebuild -workspace LearningApp.xcworkspace -scheme Memories-iOS -configuration Debug > ~/Desktop/build.txt
" - A command to copy the name of a selector without the type information,
"   such as initWithController:userInfo:
" - A command that automatically starts lldb, attaches to the process, and
"   sets a breakpoint on the cursor's current file and line.
" - Create a command that runs the clang static analyzer on the current
"   project
" - Get your vim to look like this: http://brooks.io/syntax-highlight/v2/
"   - indention markers
"   - semantic highilghting
"   - light dark color scheme with muted colors
"   - comment highlight blocks
" - Improve cocoa.vim so it doesn't show { at the end of each method in the ListMethods command
" - Fix documentation search for cocoa.vim
" - Jump to next empty line
" - Search for and jump to the definition of the method under the cursor using
"   ack.  Show results if there is more than one.  Jump to first if there is
"   only one.
" - Delete current method
" - How does vim decide with :set filetype? is?  Why is it set differently for
"   .m and .h files?  objcpp does not seem right for my .h files.
"   Extend the Matchmaker plugin to use ctags so that it only highlights
"   variables, types, or function/method names
"   Put your language-specific settings into ~/.vim/ftplugin/<filestype>.vim
"   Make the vim background stretch the entire background of Terminal.app
" - Ultimately, shouldn't cocoa.vim get constants, etc. from every file that
"   is imported to build the current buffer rather than having a static list
"   of standard library words that will not only change over time, but will
"   also miss some files that are imported but have not been c-tagged.  Two
"   ideas: 1) Use the regexes in cocoa.vim applied to all the headers found in
"   all the Frameworks and includes in the .ycm_extra_conf.py flags. 2) Use
"   ctags on all the headers in all directories in .ycm_extra_conf.py.
"   Improve the yssr behavior so that you can deal with these situations:
"   NSString *myString = NSString stringWithFormat:@"My stuffs"<cursor
"   position>
"   Maybe use https://github.com/suan/vim-instant-markdown to edit TODO lists
"   like the one in markdown and preview in real time
"   Use Syntastic to have oclint integration

" Show/hide line numbers
nnoremap <leader>n :set number<cr>
nnoremap <leader>nn :set nonumber<cr>
nnoremap <leader>m :set relativenumber<cr>
nnoremap <leader>mm :set norelativenumber<cr>
" Cool ideas to show relative or absolute line numbers depending on current use
":au FocusLost * :set number
":au FocusGained * :set relativenumber
"autocmd InsertEnter * :set number
"autocmd InsertLeave * :set relativenumber

" Automatically edit any file that is open elsewhere, skip the message that
" asks for confirmation
augroup NoSimultaneousEdits
    autocmd!
    autocmd  SwapExists  *  :let v:swapchoice = 'e'
augroup END

" vim-matchmaker
" Underline words matched by Matchmaker
highlight Matchmaker guibg=NONE
highlight Matchmaker gui=underline
highlight Matchmaker ctermbg=NONE
highlight Matchmaker cterm=underline
function! ToggleMatchmaker()
    " Don't show matches in non-code files
    if &ft =~ 'help\|mkd\|objc\|objcpp'
        Matchmaker!
    else
        Matchmaker
    endif
endfun
" TODO: Must improve performance before I can use this on Objective-C files
autocmd BufEnter * call ToggleMatchmaker()

" Remove all trailing whitespaces on file save
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType vim,mkd,c,cpp,objc,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Whenever vim gains focus, autoload any changes made by another process,
" don't try to run this in the command line.  It will cause an error
autocmd CursorHold * if getcmdwintype() == '' | checktime | endif


