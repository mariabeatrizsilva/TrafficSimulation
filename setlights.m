if t > tlc
    for i = 1:ni
        jgreen(i) = jgreen(i) + 1;
        if jgreen(i) > nbin(i)
            jgreen(i) = 1;
        end
    end
    tlc = tlc+tlcstep;
end
S = zeros(1,nb)
for i = 1:ni
    b = bin(i,jgreen(i));
    S(b) = 1;
end

% Initialization for setlights

jgreen = ones(1,ni)
tlcstep = 1 % time interval between light changes
tlc = tlcstep

