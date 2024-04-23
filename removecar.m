onroad(c) = 0; textit(c) = t
if (c==firstcar(b))
    firstcar(b) = nextcar(c)
    if (c==lastcar(b))
        lastcar(b) = 0
    end 
else 
    nextcar(ca) = nextcar(c)
    if (c==lastcar(b))
        lastcar(b) = ca
    end 
end 

%not really needed but ... 
x(c) = xd(c) 
y(c) = yd(c) 
nextcar(c) = 0 %% recall that the previously set nextc = nextcar(c)