function! decalogue#commandments#execute_noisy() abort
  function! s:exeute_noisy(cmd) closure
		execute(a:cmd)
  endfunction

  call s:run_and_execute(funcref('s:exeute_noisy'))
endfunction

function! decalogue#commandments#execute_silent() abort
  function! s:exeute_silent(cmd) closure
		execute('silent ' . a:cmd) | execute 'redraw!'
  endfunction

  call s:run_and_execute(funcref('s:exeute_silent'))
endfunction


function! s:run_and_execute(exec_func) abort
  let s:full_commandments = get(g:, 'decalogue_commandments', {})
  let numbered_commandments = s:convert_commandments_to_numbered_entries(s:full_commandments)

	let selection = inputlist(l:numbered_commandments)
	if (l:selection != 0 && l:selection <= len(s:full_commandments))
    let selected_key = keys(s:full_commandments)[l:selection - 1]

    call a:exec_func(s:full_commandments[l:selected_key])
	endif
endfunction

"convert full_commandments hash into a numbered list
function! s:convert_commandments_to_numbered_entries(commandments_hash) abort
    let index = 1
    let numbered_list = ['Commandments:']

    for key in keys(a:commandments_hash)
      let numbered_list = add(l:numbered_list, l:index . ': ' . key)
      let index += 1
    endfor

    return l:numbered_list
endfunction
