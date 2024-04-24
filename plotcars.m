function plotcars(x, y, onroad, hcars)
    global nc; % Assuming nc is the total number of cars

    if any(nc > 0) && any(sum(onroad) > 0) % Check if there are cars and at least one car is on the road
        set(hcars, 'xdata', x(onroad), 'ydata', y(onroad));
    end
end
