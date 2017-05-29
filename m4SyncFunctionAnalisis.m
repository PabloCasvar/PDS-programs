clear all 
close all 

N  = 2000;  %Number of samples 
Fs = 500;  %[Hz]  sampling frequency
Fc = 20;    %[Hz]  cut frequency
Ts = 1/Fs;  %[s]  sampling period
tt = N*Ts;  %[s]  signal duration

% "negative" time is used to keep simmetry over zero
limNeg = -1*floor(N/2)*Ts;  % "negative" time
limPos =    ceil(N/2)*Ts;   % time 
t  = linspace(limNeg, limPos, N);
df = linspace(0, Fs, N);

%  Normalized sinc function 
%  x = 2*Fc*sin(2*pi*Fc*t)/(pi*t); 
x = 2*Fc*sinc(2*Fc*t);

X = fft(x);

%  Windowed sinc
y = hamming(N)'.*x;

Y = fft(y);


figure;
subplot 221;
plot(t, x);
grid;
subplot 223;
plot(df, abs(X));
grid;
subplot 222;
plot(t, y);
grid;
subplot 224;
plot(df, abs(Y));
grid;