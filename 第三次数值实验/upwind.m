function u = upwind(h, t, a, b)
    %upwind - 迎风格式求解一维双曲问题
    %
    % Syntax: u = upwind(h,t,a,b)
    %
    % h 为空间步长, t 为时间步长, a, b 为区间端点, 要求 a 小于0, b 大于 0
    n = (b - a) / h + 1; %总共待求点数
    r = t/h;
    x0 = 1 + 1 / h * (0 - a); % x=0 所对应的点的坐标
    x1 = 1 + 1 / h * (1 - a); % x=1 所对应的点的坐标
    A = (1 - r) * speye(n) + sparse(2:n, 1:n - 1, r, n, n); % 系数矩阵A
    A(1, 1) = 1;
    u_old = zeros(n,1);
    u_old(1:x0) = 1;
    for t = 1:0.5/t
        u_new = A*u_old;
        u_old = u_new;
    end
    u = u_old(x0:x1);
end
