if nextb(c) == b
    i=i2b
    if rand<prchoice
        jnext = 1 + floor(rand*nbout(i))
        nextb(c) = bout(i,jnext)
    else 
        xdvec = xd(c) - xi(i) 
        ydvec = yd(c) - yi(i)
        dp = ux(bout(i, 1:nbout(i)))*xdvec... 
            +uy(bout(i,1:nbout(i)))*ydvec
        [dpmax,jnext] = max(dp)
        nextb(c) = bout(i,jnext);
    end 
end 