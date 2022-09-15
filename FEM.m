figure('Units', 'centimeter', 'Position', [15 3 30 16], 'name', '椭圆方程的有限元方法求解'); % 设置图片大小
sgtitle('椭圆方程的有限元方法求解');
u = @(x) 1/2 * x.^2 - x / 2 +1; % 精确解

k = 0;

for N = [6 9 18]
    k = k + 1;
    n = N -1;
    h = 1 / N;
    K = 2 / h * speye(n) + sparse(2:n, 1:n - 1, -1 / h, n, n) + sparse(1:n - 1, 2:n, -1 / h, n, n); % 总刚度矩阵
    b = -h * ones(n,1); % 总荷载矩阵
    b(1) = b(1) + 1 / h; % 进行边界修正
    b(n) = b(n) + 1 / h;
    u0 = K \ b; % 求解
    x = 0:h:1;
    subplot(1, 3, k);
    plot(linspace(0,1), u(linspace(0,1)), 'r-', 'LineWidth', 2.0) % 精确解
    set(get(gca, 'Title'), 'String', "N = " + num2str(N)); % 设置标题
    hold on
    plot(x, [1; u0; 1], 'b-o', 'LineWidth', 1.0) % 数值解
end
