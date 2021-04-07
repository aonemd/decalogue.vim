let s:full_commandments = {
      \ 'Git Status': '!git status',
      \ 'Git Push': '!git push origin HEAD',
      \ }

function! decalogue#commandments#run() abort
  function! GetNumberedDictKeys(taskDict) closure
    " Extracts the task keys and returns them as a numbered list.
    let counter = 1
    let taskList = ['Commandments: ']

    for key in sort(keys(a:taskDict))
      let taskList = add(l:taskList, l:counter . ': ' . key)
      let counter+=1
    endfor

    return l:taskList
  endfunction

	" Runs the given task number.
	let selection = inputlist(funcref('GetNumberedDictKeys')(s:full_commandments))

	if (l:selection != 0 && l:selection <= len(s:full_commandments))
		let taskKeys = sort(keys(s:full_commandments))
		execute(s:full_commandments[l:taskKeys[l:selection - 1]])
	endif
endfunction
