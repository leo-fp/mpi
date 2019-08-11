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

function! mpi#GetPlaylist()
    let command = "mpi --format '%position% @%artist% @%album% @%title%' playlist"
    let [results, playlist] = [split(system(command), '\n'), []]
    let maxLengths = {'position':[], 'artist':[], 'album':[]}

    for item in results
        let song = split(item, " @")
        let [position, artist, album, title] = song

        if (maxLengths.position[-1] + 1 > len(position) && 0)
            let position = repeat(' ',
                        \ maxLengths.position[-1] - len(position))
                        \ . position
        endif
        let position .= ' '
        let artist .= repeat(' ', maxLengths['artist'][-1] + 2 - len(artist))
        let album .= repeat(' ', maxLengths['album'][-1] + 2 - len(album))

        call add(playlist, 
                    \ {'position': position, 'artist': artist,
                    \ 'album': album, 'title': title})
    endfor
endfunction
