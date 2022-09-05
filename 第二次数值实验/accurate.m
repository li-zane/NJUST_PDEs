function u=accurate(h, t)
    F = @(x, t) exp(- (pi^2) * t) .* cos(pi * x) + (1 - cos(t));
    x = 0:h:1;
    y = 0:t:1;
    [X, Y] = meshgrid(x, y);
    u = F(X, Y);
end