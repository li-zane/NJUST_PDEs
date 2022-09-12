figure('Units', 'centimeter', 'Position', [15 3 30 16], 'name', '一维双曲方程求解'); % 设置图片大小
sgtitle("一维双曲方程的初值问题");

a = -1;
b = 2;

t = 0.005;
h = 0.01;
subplot(2,3,1)
u = upwind(h,t,a,b);
draw(h,u,"h=0.01 迎风格式");
subplot(2,3,2)
u = friedrichs(h,t,a,b);
draw(h,u,"h=0.01 Lax-Friedrichs格式");
subplot(2,3,3)
u = wendroff(h,t,a,b);
draw(h,u,"h=0.01 Lax-Wendroff格式");

t = 0.00125;
h = 0.0025;
subplot(2,3,4)
u = upwind(h,t,a,b);
draw(h,u,"h=0.0025 迎风格式");
subplot(2,3,5)
u = friedrichs(h,t,a,b);
draw(h,u,"h=0.0025 Lax-Friedrichs格式");
subplot(2,3,6)
u = wendroff(h,t,a,b);
draw(h,u,"h=0.0025 Lax-Wendroff格式");
