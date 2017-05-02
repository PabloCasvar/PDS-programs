%DFT
%The input signal contains the signal being decomposed, while the two
%signals (ImX[n] & ReX[n]) ontain the amplitudes of the comonent sine and
%cosine waves scaled
clear all 
close all

% N points   =>   N+2 signals
N = 8

% Basis functions

% ck[i] = cos(2*pi*k*i/N)
% sk[i] = sin(2*pi*k*i/N)

% ck[i] & sk[i] are the cosine ans sine waves, each N point length
% i runs from 0 to N-1
%The parameter k determines the frequency of the wave, k takes values from
%0 to N/2

%The frequency parameter k is equal to the number of complete cycles that
%occur over the N points of the signal

%  c1[]  => one complete cycle in N points
%  c2[]  => two complete cycles in N points

i = 0:N-1

t = linspace(0, i(end), 1000);

% ReX[]
for k = 0:N/2
    y  = cos(2*pi*k*i/N)
    yt = cos(2*pi*k*t/N)
    figure
    plot(i, y, 'b', t, yt, 'm');
    ylim([-1 1])
end

% ImX[]
for k = 0:N/2
    y  = sin(2*pi*k*i/N)
    yt = sin(2*pi*k*t/N)
    figure 
    plot(i, y, 'b', t, yt, 'm');
    ylim([-1 1])
end