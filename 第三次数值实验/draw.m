function  draw(h,u,fig_title)
%draw - 绘制解的图形
%
% Syntax:  draw(h,u,fig_title)
    x = 0:h:1;
    y = zeros(size(x));
    y(1:1/h/2) = 1;
    plot(x,y,'r-','LineWidth',2.0)
    hold on
    plot(x,u,'b:','LineWidth',1.5);
    axis([0 1 -0.5 1.5])
    title(fig_title);
end
