function errors = solution_error(h0, u0, h1, u1, name) % u1 表示数值解, u0 表示精确解, h 表示网格间距
    N = 1 / h1;x1 = [1, round(N / 4) + 1, round(N / 2) + 1, round(N / 4 * 3) + 1];
    N = 1 / h0;x0 = [1, round(N / 4) + 1, round(N / 2) + 1, round(N / 4 * 3) + 1];

    e = zeros(1, 4);

    for i = 1:4
        e(i) = abs(u1(end, x1(i)) - u0(end, x0(i)));
    end

    value = [u1(end,x1);u0(end,x0);e];
    rowname = [name,"精确解","误差"];

    fprintf("\t\t\t\t\t%s\n","部分解及误差阶");
    for i = 1:3
        fprintf("%+15s:\t\t\t\t",rowname(i));
        for j = 1:4
            if i == 3
                fprintf("%-12.9f    ",value(i,j));
            else
                fprintf("%-12.6f    ",value(i,j));
            end
        end
        fprintf('\n');
    end
    fprintf('\n');
    errors = e;
end
