"make this script cross platform
function! sessionmgr#ResolvePath(path)
	return resolve(expand(a:path))
endfunction

function! sessionmgr#SessionIsInRuntimePath(session)
	let dirname = split(session, "/")
	"TODO see if I actually need to check this
	let end = len(dirname)-1

	if end == 0
		return 0
	endif

	let path = join(dirname[end], "/")
	let vimpaths = split(&runtimepath, ",")

	for idx in range(len(vimpaths))
		let vimpaths[idx] = sessionmgr#ResolvePath(vimpaths[idx])
	endfor

	for runpath in runpaths
		if path =~ runpath
			return 1
		endif
	endfor
	return 0
endfunction

function! sessionmgr#CreateSession(...)
	let session = a:session
	if sessionmgr#SessionIsInRuntimePath(session)
		if exists("g:sessionmgr_rtp_session_dir")
			let path = sessionmgr#ResolvePath(g:sessionmgr_rtp_session_dir)
		else
			let path = sessionmgr#ResolvePath("~/.vim/sessions")
		endif
	endif
endfunction
