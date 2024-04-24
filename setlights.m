function S = setlights(bin, jgreen, nbin, t, tlc, tlcstep)
    if t > tlc
        for i = 1:numel(jgreen)
            jgreen(i) = jgreen(i) + 1;
            if jgreen(i) > nbin(i)
                jgreen(i) = 1;
            end
        end
        tlc = tlc + tlcstep;
    end

    % Update traffic light state
    S = zeros(1, size(bin, 2));
    for i = 1:numel(jgreen)
        b = bin(i, jgreen(i));
        if b >= 1 && b <= length(S) % Check if b is a valid index for S
            S(b) = 1;
        else
            warning('Invalid index b: %d', b);
        end
    end

    % Display or return the traffic light state, depending on your requirements
end
