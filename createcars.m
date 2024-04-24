function createcars(xi, yi, ux, uy, nc, p, x, y, onroad, i1, L, dt, R)
    global nb;

    for b = 1:nb
        if (rand < dt * R * L(b))
            nc = nc + 1;
            p(nc) = rand * L(b);
            if i1(b) >= 1 && i1(b) <= numel(xi) % Check if i1(b) is a valid index for xi
                x(nc) = xi(i1(b)) + p(nc) * ux(b);
            else
                warning('Invalid index i1(b): %d', i1(b));
                continue; % Skip this iteration and proceed to the next one
            end
            if i1(b) >= 1 && i1(b) <= numel(yi) % Check if i1(b) is a valid index for yi
                y(nc) = yi(i1(b)) + p(nc) * uy(b);
            else
                warning('Invalid index i1(b): %d', i1(b));
                continue; % Skip this iteration and proceed to the next one
            end
            onroad(nc) = 1;
            % insertnewcar; % Assuming this function is defined elsewhere
            % choosedestination; % Assuming this function is defined elsewhere
            nextb(nc) = b;
            tenter(nc) = 0; % Initialize tenter to 0
            benter(nc) = b;
            penter(nc) = p(nc);
        end
    end
end
