% /**
% * two_dim.m
% * @author Zhisheng Li
% * @description Finite Depression Approximation method to solve the Ellipse partial differential equation
% * @created 2022-08-28T18:11:26.340Z+08:00
% * @copyright None
% * None
% * @last-modified 2022-08-31T13:57:43.410Z+08:00
% */

%% 精确解
figure('Units', 'centimeter', 'Position', [15 3 20 17]); % 设置图片大小
u = @(x, y) cos(3 * x) .* sin(pi * y) / (9 + pi^2);
x = linspace(0, pi, 200);
y = linspace(0, 1, 200);
[X, Y] = meshgrid(x, y);
Z1 = u(X, Y);
subplot(4, 2, [5, 6, 7, 8]);
mesh(X, Y, Z1);
title("精确解");

% 绘制 N=32 时, 精确解的情况
figure('Units', 'centimeter', 'Position', [15 3 25 15]); % 设置图片大小
sgtitle("N=32");
title_name = ["0.25", "0.5", "0.75"];

for t = 1:3
    subplot(1, 3, t)
    plot(x, Z1(1 + 50 * t, :), "r-", "LineWidth", 2.0);
    % y = Z1(1+25*t,:);
    % y(end) = NaN;
    % c = y;
    % patch(x,y,c,'EdgeColor','interp',"LineWidth",2.0);
    title("y=" + title_name(t));
    hold on
end

%% 数值解
N = [4 8 16 32]; % 精度逐渐提高
k = 1; % 图形编号
F = @(x, y) cos(3 * x) .* sin(pi * y); % 方程右边
figure(1);

for n = N

    % 将区域网格化
    h1 = pi / n;
    h2 = 1 / n;
    x = h1:h1:pi - h1;
    y = h2:h2:1 - h2;
    [X, Y] = meshgrid(x, y); % 不包括边界的 X,Y 坐标

    % 生成矩阵
    I = eye(n - 1);
    a = -ones(n - 2, 1);
    D1 = diag(a, 1) + diag(a, -1); % 次对角线
    D0 = ones(n - 1, 1) * 2 * (1 / (h1^2) + 1 / (h2^2)); % 主对角线
    D0(1) = 1 / (h1^2) + 2 / (h2^2); % 修正第二边值条件处的系数
    D0(n - 1) = 1 / (h1^2) + 2 / (h2^2);
    A = kron(I, D1) * (1 / (h1^2)) + kron(D1, I) * (1 / (h2^2)) + kron(I, diag(D0)); % 系数矩阵
    f = reshape(F(X, Y)', [], 1); % 方程右边的向量,将其转换为有（n-1)x(n-1) 个元素的列向量, 由于边界条件都为0, 因此无需修正
    Z = reshape(A \ f, n - 1, n - 1)'; % 求数值解
    % 绘图
    subplot(4, 2, k);
    x = 0:h1:pi;
    y = 0:h2:1;
    [X, Y] = meshgrid(x, y); % 包括边界的 X,Y 坐标
    Z0 = [zeros(1, n + 1); Z(:, 1), Z, Z(:, n - 1); zeros(1, n + 1)]; % 把边界条件添加到数值解上
    surf(X, Y, Z0);
    title("N = " + num2str(n));
    k = k + 1;
end

% 绘制 N=32 时的数值解
figure(2);

for t = 1:3
    subplot(1, 3, t)
    plot(x, Z0(1 + 8 * t, :), "k--", "LineWidth", 1.0);
    legend("精确解", "数值解", "Location", "southeast");
end
