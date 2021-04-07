if exists('g:loaded_decalogue') | finish | endif
let g:loaded_decalogue = 1

command Decalogue call decalogue#commandments#run()

let s:decalogue_command = get(g:, 'decalogue_command', '<leader>dc')
execute 'nnoremap <silent>'. s:decalogue_command . ' :Decalogue<CR>'
