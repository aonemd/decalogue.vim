if exists('g:loaded_decalogue') | finish | endif
let g:loaded_decalogue = 1

command Decalogue call decalogue#commandments#execute_noisy()
command DecalogueSilent call decalogue#commandments#execute_silent()
command! -nargs=1 DecalogueRunSilent execute 'silent !' . <q-args> | execute 'redraw!'

let s:decalogue_command = get(g:, 'decalogue_command', '<leader>dc')
let s:decalogue_command_silent = get(g:, 'decalogue_command_silent', '<leader>ds')
let s:decalogue_command_run_silent = get(g:, 'decalogue_command_run_silent', '<leader>dr')

execute 'nnoremap <silent>'. s:decalogue_command . ' :Decalogue<CR>'
execute 'nnoremap <silent>'. s:decalogue_command_silent . ' :DecalogueSilent<CR>'
execute 'nnoremap '. s:decalogue_command_run_silent . ' :DecalogueRunSilent<space>'
