function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    // Tinh pham vi ket qua
    n1_start = 1 - x1origin;
    n1_end   = length(x1n) - x1origin;
    n2_start = 1 - x2origin;
    n2_end   = length(x2n) - x2origin;
    
    n_start = min(n1_start, n2_start);
    n_end   = max(n1_end, n2_end);
    yorigin = min(x1origin, x2origin);

    // Tao vector thoi gian va ket qua
    n  = n_start:n_end;
    yn = zeros(1, length(n));

    // Cong cac mau tin hieu
    for i = 1:length(n)
        if (n(i) >= n1_start) & (n(i) <= n1_end) then
            idx1 = n(i) + x1origin;
            yn(i) = yn(i) + x1n(idx1);
        end
        if (n(i) >= n2_start) & (n(i) <= n2_end) then
            idx2 = n(i) + x2origin;
            yn(i) = yn(i) + x2n(idx2);
        end
    end

    // Hien thi ket qua do thi
    subplot(3, 1, 1);
    plot2d3(n1_start:n1_end, x1n, style=5);
    e = gce();                     
    e.children.thickness = 3;
    xtitle("Tin hieu x1(n)", "n", "Bien do");
    xgrid(1);
    a = gca(); 
    a.data_bounds = [n1_start, min(x1n); n1_end, max(x1n)];

    subplot(3, 1, 2);
    plot2d3(n2_start:n2_end, x2n, style=2);
    e = gce();                     
    e.children.thickness = 3;
    xtitle("Tin hieu x2(n)", "n", "Bien do");
    xgrid(1);
    a = gca();
    a.data_bounds = [n2_start, min(x2n); n2_end, max(x2n)];

    subplot(3, 1, 3);
    plot2d3(n, yn, style=3);
    e = gce();                     
    e.children.thickness = 3;
    xtitle("Tin hieu tong y(n) = x1(n) + x2(n)", "n", "Bien do");
    xgrid(1);
    a = gca();
    a.data_bounds = [n_start, min(yn); n_end, max(yn)];
endfunction

// Goi ham va in ket qua
[yn, yorigin] = add([0, 1, 3, -2], 1, [1, 1, 2, 3], 2);
disp(yn, "Ket qua cua y(n):");
disp(yorigin, "Goc toa do cua y(n):");
