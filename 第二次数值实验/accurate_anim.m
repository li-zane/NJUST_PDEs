u = @(x, t) exp(- (pi^2) * t) .* cos(pi * x) + (1 - cos(t));

figure('Units', 'centimeter', 'Position', [15 3 20 17]); % 设置图片大小
% sgtitle("精确解动态图像");

h = 1/80;
t = 1/400;
x = 0:h:1;
y = 0:t:1;
[X, Y] = meshgrid(x, y);
Z = u(X, Y);

M = moviein(401);

for time = 1:401
    plot(x, Z(time, :));
    title("time = " + num2str(time * t));
    axis([0, 1, -1, 1]);
    M(time) = getframe;
end

Movie(M,1,25);
