let s:full_commandments = {
      \ 'Git Status': '!git status',
      \ 'Git Push': '!git push origin HEAD',
      \ }

function! decalogue#commandments#run() abort
  call s:append_custom_commandments()

  let numbered_commandments = s:convert_commandments_to_numbered_entries(s:full_commandments)

	let selection = inputlist(l:numbered_commandments)
	if (l:selection != 0 && l:selection <= len(s:full_commandments))
    let selected_key = keys(s:full_commandments)[l:selection - 1]
		execute(s:full_commandments[l:selected_key])
	endif
endfunction

"read globally set commandments and append them to full_commandments
function! s:append_custom_commandments() abort
  let g:decalogue_commandments = get(g:, 'decalogue_commandments', {})
  for key in keys(g:decalogue_commandments)
    let s:full_commandments[key] = g:decalogue_commandments[key]
  endfor
endfunction

"convert full_commandments hash into a numbered list
function! s:convert_commandments_to_numbered_entries(commandments_hash) abort
    let index = 1
    let numbered_list = ['Commandments: ']

    for key in keys(a:commandments_hash)
      let numbered_list = add(l:numbered_list, l:index . ': ' . key)
      let index += 1
    endfor

    return l:numbered_list
endfunction
