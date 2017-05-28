%   Formulaci?n b?sica
%   F(n/[N*Ts]) = F(n*fs/N) = (1/N)*sumatory[ m(k*Ts)* exp(-j*2*pi*n*k/N) ]
%   for k = 0 to N-1  with  n = 0, 1, ..., N-1

%   N   = Number of samples = []
%   Ts  = sampling period = [s]
%   fs  = sampling frequency = 1/Ts = [Hz]
%   n   = index of frequecy = []
%   m(k*Ts) = sample taken in instant k*Ts

clear all 
close all 

fs  = 10;   %[Hz] sampling frequency
N   = 16;
Ts  = 1/fs; %[s] sampling period
tt  = (N-1)*Ts  %[s] signal duration 
k   = 0:N-1;

fc  = 1.25;    %[Hz] signal frequency
t   = k*Ts;
x   = 6*sin(2*pi*fc*t); % = x(2*pi*fc*k*Ts) => m(k*Ts)


%   "n" parameter acts as index to obtain different frequencies of study
%   F(0*fs/N), F(1*fs/N), F(2*fs/N), ... , F([N-1]*fs/N)

limx = [-1.2, 1.2];
limy = [-1.2, 1.2];

X = zeros(1, N);
vectorf = zeros(1,N);

for n = 0:N-1;
    
    kernel = exp(-j*2*pi*n*k/N);
    X(n+1) = (1/N)*sum(x.*kernel);
    vectorf(n+1) = n*fs/N; 
    
    
    figure
    subplot(1, 2, 1)
    plot(real(kernel))
    ylim(limy)
    subplot(1, 2, 2)
    plot(imag(kernel))
    ylim(limy)
end

limy = [min(x), max(x)];
absX = abs(X);
figure
subplot(1, 3, 1)
plot(t, x);
xlabel('time [s]');
ylim(limy);
subplot(1, 3, 2)
plot(vectorf, absX);
subplot(1, 3, 3)
stem(vectorf(1:N/2), absX(1:N/2));
xlabel('frequency [Hz]');
ylim(limy);










