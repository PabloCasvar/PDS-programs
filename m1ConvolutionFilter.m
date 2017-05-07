x = [0 1 2 3 4 5 6];

%  y[n] = h[n]*x[n]
%  y = conv(h,x)

%  Y(z) = H(z)X(z)   =>    H(z) = Y(z)/X(z)    
%  Let A and B be the coefficients of the system
%  y = filter(A, B, x)

%% Moving average filter
% y[n] = a0 x[n] + a1 x[n-1] + ... + aN x[n-N]

%Moving average filter by convolution
N = 2
h = (1/N) * ones(1,N)
y = conv(h, x)
%Moving average filter by filter
A = (1/N) * ones(1,N)
B = [1]
y = filter(A, B, x)

%% First difference
% The discrete operation that mimics the forst derivative is called first
% difference

%first difference by convolution
h = [1 -1]
%y = conv(h, x)
%first difference by filter
A = [1 -1]
B = [1]
%y = filter(A, B, x)


%% Running sum
%The discrete operation that mimics the integral is called running sum

%running sum by convolution
h = [0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
%y = conv(h, x)
%running sum by filter
A = [1]
B = [1 -1]
%y = filter(A, B, x)

stem(y);