if exists('g:loaded_decalogue') | finish | endif
let g:loaded_decalogue = 1

command Decalogue call decalogue#commandments#execute()
command DecalogueSilent call decalogue#commandments#execute_silent()

let s:decalogue_command = get(g:, 'decalogue_command', '<leader>dc')
let s:decalogue_command_silent = get(g:, 'decalogue_command_silent', '<leader>ds')

execute 'nnoremap <silent>'. s:decalogue_command . ' :Decalogue<CR>'
execute 'nnoremap <silent>'. s:decalogue_command_silent . ' :DecalogueSilent<CR>'
