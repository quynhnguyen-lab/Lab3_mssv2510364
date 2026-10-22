funcprot(0); // Tat canh bao dinh nghia lai ham

// 1. Dinh nghia truc thoi gian va tin hieu x(n)
n = -8:8;
x = zeros(1, length(n));

for i = 1:length(n)
    if (n(i) >= -2) & (n(i) <= 2) then
        x(i) = 1;
    elseif (n(i) == 3) | (n(i) == 4) then
        x(i) = 0.5;
    else
        x(i) = 0;
    end
end

// Ham phu tro lay gia tri x(k)
function val = get_x(k, n_vec, x_vec)
    idx = find(n_vec == k);
    if isempty(idx) then
        val = 0;
    else
        val = x_vec(idx);
    end
endfunction

// 2. Tinh toan tin hieu cho tung cau
xa = zeros(1, length(n));
xb = zeros(1, length(n));
xc = zeros(1, length(n));
xd = zeros(1, length(n));
xe = zeros(1, length(n));
xf = zeros(1, length(n));
xg = zeros(1, length(n));
xh = zeros(1, length(n));

for i = 1:length(n)
    ni = n(i);
    
    // (a) x(n - 2)
    xa(i) = get_x(ni - 2, n, x);
    
    // (b) x(4 - n)
    xb(i) = get_x(4 - ni, n, x);
    
    // (c) x(n + 2)
    xc(i) = get_x(ni + 2, n, x);
    
    // (d) x(n) * u(2 - n)
    u_2_n = 0;
    if (2 - ni) >= 0 then u_2_n = 1; end
    xd(i) = x(i) * u_2_n;
    
    // (e) x(n - 1) * delta(n - 3)
    delta_n_3 = 0;
    if (ni == 3) then delta_n_3 = 1; end
    xe(i) = get_x(ni - 1, n, x) * delta_n_3;
    
    // (f) x(n^2)
    xf(i) = get_x(ni^2, n, x);
    
    // (g) Phan chan: x_e(n) = 0.5 * [x(n) + x(-n)]
    xg(i) = 0.5 * (x(i) + get_x(-ni, n, x));
    
    // (h) Phan le: x_o(n) = 0.5 * [x(n) - x(-n)]
    xh(i) = 0.5 * (x(i) - get_x(-ni, n, x));
end

// 3. Ve do thi Window 1: x(n) va cac cau (a), (b), (c), (d)
figure(1); clf;

subplot(5, 1, 1);
plot2d3(n, x, style=5); e = gce(); e.children.thickness = 2;
xtitle("Tin hieu goc x(n)", "n", "Bien do"); xgrid(1);

subplot(5, 1, 2);
plot2d3(n, xa, style=2); e = gce(); e.children.thickness = 2;
xtitle("Cau (a): x(n - 2)", "n", "Bien do"); xgrid(1);

subplot(5, 1, 3);
plot2d3(n, xb, style=3); e = gce(); e.children.thickness = 2;
xtitle("Cau (b): x(4 - n)", "n", "Bien do"); xgrid(1);

subplot(5, 1, 4);
plot2d3(n, xc, style=6); e = gce(); e.children.thickness = 2;
xtitle("Cau (c): x(n + 2)", "n", "Bien do"); xgrid(1);

subplot(5, 1, 5);
plot2d3(n, xd, style=7); e = gce(); e.children.thickness = 2;
xtitle("Cau (d): x(n)*u(2 - n)", "n", "Bien do"); xgrid(1);


// 4. Ve do thi Window 2: Các cau (e), (f), (g), (h)
figure(2); clf;

subplot(4, 1, 1);
plot2d3(n, xe, style=2); e = gce(); e.children.thickness = 2;
xtitle("Cau (e): x(n - 1)*delta(n - 3)", "n", "Bien do"); xgrid(1);

subplot(4, 1, 2);
plot2d3(n, xf, style=3); e = gce(); e.children.thickness = 2;
xtitle("Cau (f): x(n^2)", "n", "Bien do"); xgrid(1);

subplot(4, 1, 3);
plot2d3(n, xg, style=6); e = gce(); e.children.thickness = 2;
xtitle("Cau (g): Phan chan xe(n)", "n", "Bien do"); xgrid(1);

subplot(4, 1, 4);
plot2d3(n, xh, style=7); e = gce(); e.children.thickness = 2;
xtitle("Cau (h): Phan le xo(n)", "n", "Bien do"); xgrid(1);
