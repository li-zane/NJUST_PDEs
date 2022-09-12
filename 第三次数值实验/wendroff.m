function u = wendroff(h, t, a, b)
    %wendroff - Description
    %
    % Syntax: u = wendroff(h,t,a,b)
    n = (b - a) / h + 1; %总共待求点数
    r = t / h;
    x0 = 1 + 1 / h * (0 - a); % x=0 所对应的点的坐标
    x1 = 1 + 1 / h * (1 - a); % x=1 所对应的点的坐标
    A = sparse(2:n - 1, 1:n - 2, r * (1 + r) / 2, n, n) + sparse(2:n - 1, 3:n, r * (r - 1) / 2, n, n) + (1 - r^2) * speye(n); % 系数矩阵
    A(1, 1) = 1;
    A(n, n - 2) = r * (1 + r) / 2;
    A(n, n - 1) = 1 - r^2;
    A(n, n) = r * (r - 1) / 2;
    u_old = zeros(n, 1);
    u_old(1:x0) = 1;

    for t = 1:0.5 / t
        u_new = A * u_old;
        u_old = u_new;
    end

    u = u_old(x0:x1);
end
