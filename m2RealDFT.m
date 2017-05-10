%DFT
%The input signal x[n] contains the signal being decomposed, while the two
%signals (ImX[n] & ReX[n]) contain the amplitudes of the component sine and
%cosine waves scaled
clear all 
close all

% N points   =>   N+2 signals
N = 10

%%Basis functions

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

% t simulates "continous" time variable
t = linspace(0, i(end), 1000);


toPlot = N <= 16;

% Basis functions generator
% ReX[]  basis functions
matReXBasis = zeros(N/2+1, N);
for k = 0:N/2
    y  = cos(2*pi*k*i/N);
    yt = cos(2*pi*k*t/N);
    
    matReXBasis(k+1, :) = y;
    
    if toPlot
        figure
        plot(i, y, 'b', t, yt, 'm');
        ylim([-1 1])
    end
end

% ImX[] basis functions
matImXBasis = zeros(N/2+1, N);
for k = 0:N/2
    y  = sin(2*pi*k*i/N);
    yt = sin(2*pi*k*t/N);
    
    matImXBasis(k+1, :) = y;
    if toPlot
        figure 
        plot(i, y, 'b', t, yt, 'm');
        ylim([-1 1])
    end
end

%%Signal to transform
%% Sine wave
x = sin(2*pi*3*i/N);

%% Cosine wave
x = sin(2*pi*10*i/N);

%% unit impulse
x = zeros(1, length(i)); x(1) = 1;

%% step
x = ones(1, length(i));

%% Signal transformation
%Using dot product between x signal and basis functions the similarity
%between them can be measured
ReX = x*matReXBasis';
ImX = x*matImXBasis';

maxV = max(max(ReX), max(ImX));
minV = min(min(ReX), min(ImX));
k = 0:N/2;

figure 
subplot(1, 2, 1)
stem(k, ReX)
ylim([minV, maxV])
title('ReX');

subplot(1, 2, 2)
stem(k, ImX)
ylim([minV, maxV])
title('ImX');

%Normalizing values for ReX and ImX
normReX = (2/N)*ReX;
normImX = (2/N)*ImX;

%the spetial cases ReX[0] and Im[N/2] has to be normalized by (1/N)
normReX(1)   = normReX(1)/2;
normReX(N/2 + 1) = normReX(N/2 +1)/2;

maxV = max(max(normReX), max(normImX));
minV = min(min(normReX), min(normImX));
k = 0:N/2;

figure 
subplot(1, 2, 1)
stem(k, normReX)
ylim([minV, maxV])
title('normalize ReX');

subplot(1, 2, 2)
stem(k, normImX)
ylim([minV, maxV])
title('normalize ImX');

% Changing to frequency representation
MagX    = sqrt(ReX.^2 + ImX.^2);
PhaseX  = atan(ImX./ReX);         %note: analize atan (arctan) properties

figure 
subplot(1, 2, 1)
stem(k, MagX)
title('MagX');

subplot(1, 2, 2)
stem(k, PhaseX)
title('PhaseX');

%% Returning to time domain

%normalize ReX[] and ImX are transposed and replicated in order to perforn
%elemnt weise multiplications by the basis functions, theen aummation is
%performed
figure
plot(sum(repmat(normReX', 1, N).*matReXBasis))
figure
plot(sum(repmat(normImX', 1, N).*matImXBasis))
