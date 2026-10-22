funcprot(0); // Tat canh bao dinh nghia lai ham

function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    // 1. Tinh do dai va goc toa do cua tin hieu ket qua
    Lx = length(xn);
    Lh = length(hn);
    Ly = Lx + Lh - 1;
    
    yorigin = xorigin + horigin - 1;

    // 2. Tinh pham vi thoi gian
    nx_start = 1 - xorigin;
    nx_end   = Lx - xorigin;
    
    nh_start = 1 - horigin;
    nh_end   = Lh - horigin;
    
    ny_start = nx_start + nh_start;
    ny_end   = ny_start + Ly - 1;
    
    ny = ny_start:ny_end;

    // 3. Tinh phep tinh chap bang ham convol tich hop san trong Scilab
    yn = convol(xn, hn);

    // 4. Hien thi do thi 3 tin hieu
    subplot(3, 1, 1);
    plot2d3(nx_start:nx_end, xn, style=5);
    e = gce(); e.children.thickness = 3;
    xtitle("Tin hieu x(n)", "n", "Bien do");
    xgrid(1);

    subplot(3, 1, 2);
    plot2d3(nh_start:nh_end, hn, style=2);
    e = gce(); e.children.thickness = 3;
    xtitle("Tin hieu h(n)", "n", "Bien do");
    xgrid(1);

    subplot(3, 1, 3);
    plot2d3(ny, yn, style=3);
    e = gce(); e.children.thickness = 3;
    xtitle("Tin hieu tich chap y(n) = x(n) * h(n)", "n", "Bien do");
    xgrid(1);
endfunction

// Goi ham chay thu voi vi du
[yn, yorigin] = convolution([0, 1, 3, -2], 1, [1, 1, 2, 3], 2);
disp(yn, "Ket qua cua y(n):");
disp(yorigin, "Goc toa do cua y(n):");
