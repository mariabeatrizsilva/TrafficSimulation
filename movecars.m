function c = firstcar(b)
    global nb; % Assuming nb is the total number of blocks
    global nextb; % Assuming nextb is an array storing the index of the next car in each block

    c = -1; % Initialize c to -1 indicating no car found in the block yet
    for i = 1:numel(nextb)
        if nextb(i) == b % Check if the next block of the car is b
            c = i; % Assign the index of the car to c
            break; % Exit the loop once the first car in block b is found
        end
    end
end


for b = 1:nb
    c = firstcar(b);
    while(c>0)
        if(c==firstcar(b))
            if (bd(c)==b)&&(pd(c)>p(c))
                d=dmax
            elseif(S(b)==0)
                d=L(b)-p(c)
            else 
                decidenextblock
                if(lastcar(nextb(c)))>0
                    d = (L(b)-p(c))+p(lastcar(nextb(c)))
                else
                    d=dmax
                end
            end
        else
            d=p(ca)-p(c)
        end
        pz = p(c); nextc=nextcar(c)
        p(c) = p(c) + dt*v(d)
        if (b==bd(c)) && (pz<pd(c)) && (pd(c)<=p(c))
            removecar 
        elseif (L(b)<=p(c))
            p(c) = p(c) - L(b)
            if (nextb(c) == bd(c)) && (pd(c)<=p(c))
                removecar
            else   
                cartonextblock
            end
        else 
            x(c) = xi(i1(b)) + p(c) * ux(b)
            y(c) = yi(i1(b)) + p(c) * uy(b)
            ca = c
        end 
        c = nextc %% save next value of nextcar(c)
    end %% end while loop over cars on block
end %% end for loop lover blocks