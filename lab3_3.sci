clc;
close;
clear;
clf;

function [yn, yorigin] = fold (xn, xorigin)
    yn = flipdim(xn, 2);
    yorigin = length(xn) - xorigin + 1;
    n_x = (1:length(xn)) - xorigin; 
    n_y = flipdim(-n_x, 2); 
// Ve tin hieu goc x(n)
   subplot(2, 1, 1);
   plot2d3(n_x, xn, style=2);
   e = gce();                     
   e.children.thickness = 3;
   xtitle("Tin hieu goc x(n)", "n", "x(n)");
   xgrid();

// Ve tin hieu dao nguoc y(n)
   subplot(2, 1, 2);
   plot2d3(n_y, yn, style=5);
   e = gce();                     
   e.children.thickness = 3;
   xtitle("Tin hieu dao nguoc y(n)", "n", "y(n)");
   xgrid();
   endfunction
// Kiem tra
 [yn, yorigin] = fold ([1, -2, 3, 6], 3);
 yn // ket qua: [6, 3, -2, 1]
 yorigin // ket qua: 2  
