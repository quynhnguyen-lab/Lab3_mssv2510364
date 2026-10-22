clc;
close;
clear;
clf;

function [yn, yorigin] = advance (xn, xorigin, k)
    // k <= 0: Bao loi va in ra console, k > 0: Hoat dong binh thuong
    if k <= 0 then
       error("Gia tri k phai lon hon 0.");
    end
    yn = xn;
    yorigin = xorigin + k;
    n_x = (1:length(xn)) - xorigin; // Truc thoi gian x(n)
    n_y = (1:length(yn)) - yorigin; // Truc thoi gian y(n)

 // Ve tin hieu goc x(n)
    subplot(2, 1, 1);
    plot2d3(n_x, xn, style=2);
    e = gce();                      
    e.children.thickness = 3;
    xtitle("Tin hieu goc x(n)", "n", "x(n)");
    xgrid();

// Ve tin hieu som y(n)
    subplot(2, 1, 2);
    plot2d3(n_y, yn, style=5);
    e = gce();                     
    e.children.thickness = 3;
    xtitle("Tin hieu som y(n)", "n", "y(n)");
    xgrid();
    endfunction
// Kiem tra
   [yn, yorigin] = advance ([1, -2, 3, 6], 3, 1);
   yn // Ket qua: [1, -2, 3, 6]
   yorigin // Ket qua: 4
