clc;
close all;
clear;

% Part 1
N = 50000;
t_analog = 0: 3/N :3;
m_analog = 10 + 5*sin(3*pi*t_analog) + 3*(cos(pi*t_analog)).^3 + sin (pi*t_analog/4);

figure;
plot(t_analog,m_analog);
title('Analog signal');
xlabel('t');


% Part 2
fs = 500;
t = 0: 3/100 :3 - 3/100;
m_digital = zeros(1,N/fs);

for i = 1:N/fs
    m_digital(i) = m_analog(i * fs);
end

figure;
plot(t,m_digital);
title('Sampled signal');
xlabel('t');


% Part 3
q0 = min(m_digital) - 0.5;
q31 = max(m_digital) + 0.5;
Qlevel = q0: (q31 - q0 ) / 31 :q31;

Q_signal = zeros(1,length(t));
for i = 1:length(Q_signal)
    for j = 1:length(Qlevel)
        compare(j) = abs(m_digital(i) - Qlevel(j));
    end
    [M,k(i)] = min(compare);
    Q_signal(i) = Qlevel(k(i));
end

figure;
plot(t,Q_signal);
title('Quantized signal');
xlabel('t');


% Part 4
load p.mat;
fs = 1000;
t = 0:1/fs:100 - 1/fs;
energy_p = sum(p.^2)
pulse_domain = -31:2:31;

for i = 1:length(t)
    pulse_quantized(i) = pulse_domain(k(ceil(i / 1000))) * p(rem(i,1000) + 1);
    pulse_quantized_domain(ceil(i / 1000)) = pulse_domain(k(ceil(i / 1000)));
end

figure;
plot(t,pulse_quantized);
title('pulse quantized signal');
xlabel('t');

graycode = [[0, 0, 0, 0, 0];[0, 0, 0, 0, 1];[0, 0, 0, 1, 1];[0, 0, 0, 1, 0];
        [0, 0, 1, 1, 0];[0, 0, 1, 1, 1];[0, 0, 1, 0, 1];[0, 0, 1, 0, 0];
        [0, 1, 1, 0, 0];[0, 1, 1, 0, 1];[0, 1, 1, 1, 1];[0, 1, 1, 1, 0];
        [0, 1, 0, 1, 0];[0, 1, 0, 1, 1];[0, 1, 0, 0, 1];[0, 1, 0, 0, 0];
        [1, 1, 0, 0, 0];[1, 1, 0, 0, 1];[1, 1, 0, 1, 1];[1, 1, 0, 1, 0];
        [1, 1, 1, 1, 0];[1, 1, 1, 1, 1];[1, 1, 1, 0, 1];[1, 1, 1, 0, 0];
        [1, 0, 1, 0, 0];[1, 0, 1, 0, 1];[1, 0, 1, 1, 1];[1, 0, 1, 1, 0];
        [1, 0, 0, 1, 0];[1, 0, 0, 1, 1];[1, 0, 0, 0, 1];[1, 0, 0, 0, 0];];

for i=1:length(k)
    signal_graycode(i,:) = graycode(k(i),:);
end


% Part 5
pwer_pulse_quantized = sum(pulse_quantized.^2) / length(pulse_quantized);
SNR = 10^(2/10);
N_P = pwer_pulse_quantized / SNR;
N = randn(1,length(t)) * sqrt(N_P);

received_signal = N + pulse_quantized;

figure;
plot(t,received_signal);
title('received signal');
xlabel('t');


% Part 6
for i = 1:length(t)/fs
    for j = 1:length(p)
        mult(j) = p(j) * received_signal(j + (i-1)*fs);
    end
    mult = sum(mult);
    decoded_domain(i) = floor(mult/energy_p);
    if rem(decoded_domain(i),2) == 0
        decoded_domain(i) = decoded_domain(i) + 1;
    end
end

t = 0: 3/100 :3 - 3/100;

decoded_sig = zeros(1,length(t));
for i = 1:length(decoded_sig)
    for j=1:32
        if decoded_domain(i) == pulse_domain(j)
            decoded_sig(i) = Qlevel(j);
        end
    end
end

figure;
plot(t,decoded_sig);
title('decoded signal');
xlabel('t');

if decoded_domain(i) == pulse_domain(j)
            decoded_sig(i) = Qlevel(j);
end

for i=1:length(k)
    for j=1:32
        if decoded_domain(i) == pulse_domain(j)
            decoded_graycode(i,:) = graycode(j,:);
        end
    end
end

miss = 0;
for i = 1:length(decoded_graycode)
    sub = decoded_graycode(i,:)- signal_graycode(i,:);
    if (sub(1,1) ~= 0) || (sub(1,2) ~= 0) || (sub(1,3) ~= 0) || (sub(1,4) ~= 0) || (sub(1,5) ~= 0)
        miss = miss + 1;
    end
end 

error = miss/length(decoded_graycode)





