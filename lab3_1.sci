clc;
close;
clear;
clf;

function [yn, yorigin] = delay (xn, xorigin, k)
    // k <= 0: Báo lỗi và in ra console, k > 0: Hoạt động bình thường
    if k <= 0 then
        error("Giá trị k phải lớn hơn 0.");
    end
    yn = xn;
    yorigin = xorigin - k;
    n_x = (1:length(xn)) - xorigin;  // Trục thời gian x(n)
    n_y = (1:length(yn)) - yorigin;  // Trục thời gian y(n)

    // Vẽ tín hiệu gốc x(n) với nét vẽ dày hơn (thickness=3)
    subplot(2, 1, 1);
    plot2d3(n_x, xn, style=2);
    e = gce();                        // Lấy đối tượng đồ thị vừa vẽ
    e.children.thickness = 3;         // Tăng độ dày các cột biểu diễn
    xtitle("Tín hiệu gốc x(n)", "n", "x(n)");
    xgrid();

    // Vẽ tín hiệu trễ y(n) với nét vẽ dày hơn (thickness=3)
    subplot(2, 1, 2);
    plot2d3(n_y, yn, style=5);
    e = gce();                        // Lấy đối tượng đồ thị vừa vẽ
    e.children.thickness = 3;         // Tăng độ dày các cột biểu diễn
    xtitle("Tín hiệu trễ y(n)", "n", "y(n)");
    xgrid();
endfunction

// Test
[yn, yorigin] = delay ([1, -2, 3, 6], 3, 1);
yn          // answer: [1, -2, 3, 6]
yorigin     // answer: 2
