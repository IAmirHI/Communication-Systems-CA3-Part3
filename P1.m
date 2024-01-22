clc;
close all;
clear;

% Part 1
z = 0: 0.01 :10;
f_z = z.*exp (-z.^2/2).*heaviside (z);

figure;
plot (z, f_z);
xlabel ('z');
title ('f(z)');


% Part 2
nbins = 125;

x = randn(1,1000);
y = randn(1,1000);

figure;
subplot(2,1,1);
histogram(x, nbins)
title('x   N = 1000');

subplot(2,1,2);
histogram(y, nbins)
title('y   N = 1000');


% Part 3
z = sqrt(x.*x + y.*y);

E_z_1000 = mean(z)
var_z_1000 = mean(z.*z) - E_z_1000^2

figure;
histogram(z, nbins)
title('z   N = 1000');


% Part 4
x = randn(1,100000);
y = randn(1,100000);

figure;
subplot(2,1,1);
histogram(x, nbins)
title('x   N = 100000');

subplot(2,1,2);
histogram(y, nbins)
title('y   N = 100000');

z = sqrt(x.*x + y.*y);

E_z_100000 = mean(z)
var_z_100000 = mean(z.*z) - E_z_100000^2

figure;
histogram(z, nbins)
title('z   N = 100000');



