funcprot(0); // Tat canh bao dinh nghia lai ham

// 1. Dinh nghia trục thoi gian n va tin hieu goc x(n)
n = -10:10;
x = zeros(1, length(n));

for i = 1:length(n)
    if (n(i) >= -3) & (n(i) <= -1) then
        x(i) = 1 + n(i)/3;
    elseif (n(i) >= 0) & (n(i) <= 3) then
        x(i) = 1;
    else
        x(i) = 0;
    end
end

// 2. Tinh toan tin hieu cho cau (b.1) va cau (c): x(-n + 4)
y_b1_c = zeros(1, length(n));
for i = 1:length(n)
    idx = find(n == (-n(i) + 4));
    if ~isempty(idx) then
        y_b1_c(i) = x(idx);
    end
end

// 3. Tinh toan tin hieu cho cau (b.2): x(-n - 4)
y_b2 = zeros(1, length(n));
for i = 1:length(n)
    idx = find(n == (-n(i) - 4));
    if ~isempty(idx) then
        y_b2(i) = x(idx);
    end
end

// 4. Ve do thi tung cau
clf; // Xoa do thi cu

// --- Cau (a): Do thi tin hieu x(n) ---
subplot(3, 1, 1);
plot2d3(n, x, style=5);
e = gce(); e.children.thickness = 3;
xtitle("Cau (a): Do thi tin hieu goc x(n)", "n", "Bien do");
xgrid(1);

// --- Cau (b.1) & Cau (c): Do thi tin hieu x(-n + 4) ---
subplot(3, 1, 2);
plot2d3(n, y_b1_c, style=2);
e = gce(); e.children.thickness = 3;
xtitle("Cau (b.1) & Cau (c): Do thi tin hieu x(-n + 4)", "n", "Bien do");
xgrid(1);

// --- Cau (b.2): Do thi tin hieu x(-n - 4) ---
subplot(3, 1, 3);
plot2d3(n, y_b2, style=3);
e = gce(); e.children.thickness = 3;
xtitle("Cau (b.2): Do thi tin hieu x(-n - 4)", "n", "Bien do");
xgrid(1);
