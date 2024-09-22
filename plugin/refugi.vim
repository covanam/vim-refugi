if &cp
	finish
endif

let s:refugi_plugin_dir = fnamemodify(expand("<sfile>"), ":h:r")
let s:refugi_bin_dir = resolve(s:refugi_plugin_dir . "/../bin/")
let s:refugi_git_wrapper_bin = s:refugi_bin_dir . "/git-wrapper.sh"
let s:refugi_git_actual_bin = 'git'

augroup refugi
	au!
	au VimEnter * let g:fugitive_git_executable = s:refugi_git_wrapper_bin
	au VimEnter * let g:gitgutter_git_executable = s:refugi_git_wrapper_bin
	au VimLeave * call system(s:refugi_git_wrapper_bin . " " . "--close-ssh-tunnels")
augroup END
