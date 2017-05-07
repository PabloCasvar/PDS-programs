close all;
clear all;

%  y[n] = h[n]*x[n]
%  y = conv(h,x)

% Let 
% y[n] = a0 x[n] + ... + aN x[n-N] + b1 y[n-1] + ... + bM y[n-M]

% If an UNIT IMPULSE pass through the system an IMPULSE RESPONSE is
% obtainded at the output

%  Y(z) = H(z)X(z)   =>    H(z) = Y(z)/X(z)

%  Let A and B be the coefficients of the system
%  y = filter(A, B, x)

% Signals to analyze
M = 100;
t = linspace(0,2*pi,M);
n = 0:M;

%% unit impulse
x = zeros(1, M); x(1) = 1;

%% step
x = ones(1, M);

%% sine
x = sin(2*pi*1*t);

%% Cosine
x = cos(2*pi*1*t);


%% Moving average filter
% y[n] = a0 x[n] + a1 x[n-1] + ... + aN x[n-N]

% Moving average filter by convolution
N = 2
h = (1/N) * ones(1,N)
y = conv(h, x)
%Moving average filter by filter
A = (1/N) * ones(1,N)
B = [1]
y = filter(A, B, x)

%Graph the impulse response of the system
impz(A, B, M);
figure

%Graph the frequency response of the system
freqz(A,B);

yAverage = y;

%% First difference
% The discrete operation that mimics the forst derivative is called first
% difference

%first difference by convolution
h = [1 -1]
y = conv(h, x)
%first difference by filter
A = [1 -1]
B = [1]
y = filter(A, B, x)

figure
impz(A, B, M);
figure
freqz(A, B);
yDiff = y;

%% Running sum
%The discrete operation that mimics the integral is called running sum

%running sum by convolution
h = [0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
y = conv(h, x)
%running sum by filter
A = [1]
B = [1 -1]
y = filter(A, B, x)

figure
impz(A, B, M);
figure
freqz(A,B);
ySum = y;

%% PLOT
limS = max([max(x), max(yAverage), max(yDiff), max(ySum)]);
limI = min([min(x), min(yAverage), min(yDiff), min(ySum)]);
lims = [limI, limS];

figure
subplot(2,2, 1);
stem(x);
title('Original signal');
ylim(lims);
subplot(2,2, 2);
stem(yAverage);
title('Average filter');
ylim(lims);
subplot(2,2, 3);
stem(yDiff);
title('First difference');
ylim(lims);
subplot(2,2, 4);
stem(ySum);
title('Running sum');
ylim(lims);
