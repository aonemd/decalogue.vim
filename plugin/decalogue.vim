if exists('g:loaded_decalogue') | finish | endif
let g:loaded_decalogue = 1

command Decalogue call decalogue#commandments#run()
