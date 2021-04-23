function! decalogue#commandments#execute_in_foreground() abort
  function! s:execute_in_foreground(cmd) closure
		execute(a:cmd)
  endfunction

  call s:run_and_execute(funcref('s:execute_in_foreground'), "Commandments:")
endfunction

function! decalogue#commandments#execute_in_background() abort
  function! s:execute_in_background(cmd) closure
		execute('silent ' . a:cmd) | execute 'redraw!'
  endfunction

  call s:run_and_execute(funcref('s:execute_in_background'), "Commandments (async):")
endfunction


function! s:run_and_execute(exec_func, menu_title) abort
  let s:full_commandments = get(g:, 'decalogue_commandments', {})
  let numbered_commandments = s:convert_commandments_to_numbered_entries(s:full_commandments, a:menu_title)

	let selection = inputlist(l:numbered_commandments)
	if (l:selection != 0 && l:selection <= len(s:full_commandments))
    let selected_key = sort(keys(s:full_commandments))[l:selection - 1]

    call a:exec_func(s:full_commandments[l:selected_key])
	endif
endfunction

"convert full_commandments hash into a numbered list
function! s:convert_commandments_to_numbered_entries(commandments_hash, ...) abort
    let index = 1

    let title = get(a:, 1, "Commandments:")
    let numbered_list = [title]

    for key in sort(keys(a:commandments_hash))
      let numbered_list = add(l:numbered_list, l:index . ': ' . key)
      let index += 1
    endfor

    return l:numbered_list
endfunction
