clc
clear
# Normal distribution

a = 5;
s = 2;
n = 100;

_x = 0.1 : 0.1 : 10;
Fx = normcdf(_x, a, s);

x = sort(a + s * randn(n, 1));
y = 1 / n : 1 / n : 1;

[z1, z2] = stairs(x, y);
figure(1)
plot(_x, Fx, z1, z2), grid

gamma = 0.95;
u = 1.36;
F1 = max(0, y - u / sqrt(n));
F2 = min(1, y + u / sqrt(n));
figure(2)
plot(_x, Fx, 'r', x, y, x, F1, x, F2), grid

n = 10 ^ 4;
x = sort(a + s * randn(n, 1));
y = 1 / n : 1 / n : 1;
Fn = normcdf(x, a, s);
D = sqrt(n) * max(max(abs(Fn - y'), abs(Fn - y' + 1 / n)))

if (D < u)
  result = ['H0']
else
  result = ['H1']
endif

pause()
