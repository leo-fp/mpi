function! mpi#DisPlaylist()
    let cmd = "mpi --format '%title% (%artist%)' current"
    let playlist = split(system(cmd), '\n')
    
    for track in playlist
        if (playlist[0] == track)
            execute "normal! I".track
        else
            call append(line('$'), track)
        endif
    endfor
endfunction

function! mpi#PlaySong(no)
    let song = split(getline(a:no), " ")
    let results = split(system("mpi --format 'title% (%artist%)'i play"
                \ .song[0]), "\n")
    let message = '[mpc] NOW PLAYING: '.results[0]
    echomsg message
endfunction
