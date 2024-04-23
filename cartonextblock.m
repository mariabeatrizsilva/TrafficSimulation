firstcar(b) = nextcar(c) 
if (c=lastcar(b))
    lastcar(b) = 0 
end 
if (lastcar(nextb(c)) ==0)
    firstcar(nextb(c)) = ca
else
    nextcar(lastcar(nextb(c))) = c
end
lastcar(nextb(c)) = c
nextcar(c) = 0 
%% this is why we set nextc = nextcar(c) 
x(c) = xi(i1(nextcarb(c))) + p(c) * ux(nextb(c))
y(c) = yi(i1(nextcarb(c))) + p(c) * uy(nextb(c))
