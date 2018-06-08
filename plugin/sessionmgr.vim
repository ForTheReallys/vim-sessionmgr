function! SessionInit()
	let s:this_session = v:this_session
endfunction

function! SessionSave()
	if s:this_session != ""
		call sessionmgr#CreateSession(s:this_session)
	endif
endfunction

augroup Sessions
	autocmd!
	autocmd VimEnter * call SessionInit()
	autocmd VimLeave * call SessionSave()
augroup end
