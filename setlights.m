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
        S(b) = 1;
    end

    % Display or return the traffic light state, depending on your requirements
end
