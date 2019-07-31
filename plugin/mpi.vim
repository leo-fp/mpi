function! OpenMPI()
    if (bufexists('mpi.mpdv'))
        let mpiwin = bufwinnr('mpi.mpdv')
        if (mpiwin == -1)
            execute "sbufer ".bufnr('mpc.mpdv')
        else
            execute mpiwin.'wincmd w'
            return
        endif
    else
        execute "new mpi.mpdv"
    endif
    call mpi#DisPlaylist()
endfunction
