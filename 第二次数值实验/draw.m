% 绘图函数
function draw(h, t, Z, k, titl)
    subplot(2, 2, k);
    x = 0:h:1; y = 0:t:1;
    [X, Y] = meshgrid(x, y); % 区间网格化
    mesh(X, Y, Z); % 绘制图形
    title(titl); xlabel("x"); ylabel("t");
end