clc;
close all;
clear;

% Part 2
fs = 100;
ts = 1/fs;
t_end=0.5;
t_start=-0.5;
t= t_start :ts: t_end;
N = 10^4;

A = 10;
w = 5*pi;
teta = rand(1,N);
teta = 2 * pi * teta;
x = zeros(length(teta),length(t));
for i = 1:length(teta)
    for j = 1:length(t)
        x(i,j) = A .* cos(w * t(j) + teta(i));
    end
end

x_mean_teta = mean(x,1);

figure;
plot (t,x_mean_teta);
title('x mean teta');
xlabel('t');
ylim([-2,2]);


% Part 3
tao = -0.5 :ts: 0.5;
x_tao = zeros(length(teta),length(t),length(tao));
for i = 1:length(teta)
    for j = 1:length(t)
        for k = 1:length(tao)
            x_tao(i,j,k) = A .* cos(w * (t(j) + tao(k)) + teta(i));
        end
    end
end

x = repmat(x, 1, 1, length(tao));
x_tao_mean_teta = mean(x_tao .* x,1);
Rx = squeeze(x_tao_mean_teta);

figure;
mesh(t, tao, Rx);


% Part 4
theory_mean_x = zeros(1,length(t));

figure;
plot (t,theory_mean_x);
title('x mean teta in theory');
xlabel('t');

Rx_theory = (A^2 / 2) * cos(w*tao);

figure;
plot (tao,Rx_theory);
title('Rx in theory');
xlabel('tao');


% Part 5
Rx_mean_t = mean(Rx,1);

figure;
plot(tao,Rx_mean_t);
title("Rx mean t");
xlabel('tao');

