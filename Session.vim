let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Documents/Github/Nextproperty-website/server
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +62 src/app.ts
badd +1 src/database.ts
badd +1 src/routes/property.router.ts
badd +1 src/models/property.ts
badd +26 src/middlewares/navbar.middleware.ts
badd +25 src/middlewares/auth.middleware.ts
badd +28 src/controllers/user.controller.ts
badd +38 src/models/user.ts
argglobal
%argdel
edit src/controllers/user.controller.ts
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
let s:l = 25 - ((24 * winheight(0) + 33) / 66)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
25
normal! 027|
wincmd w
argglobal
if bufexists("src/models/user.ts") | buffer src/models/user.ts | else | edit src/models/user.ts | endif
let s:l = 38 - ((37 * winheight(0) + 33) / 66)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
38
normal! 065|
wincmd w
2wincmd w
wincmd =
if exists(':tcd') == 2 | tcd ~/Documents/Github/Nextproperty-website/server | endif
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFAc
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
