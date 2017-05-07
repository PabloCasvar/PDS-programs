%Arctan properties
clear all;
close all;

x = linspace(-2*pi, 2*pi, 1000);

%% tangent
% Domain:       {x | x != (n+1/2)*PI ; n integer}
% Counterdomain:(-inf, +inf)

tanx = tan(x);
plot(x, tanx);
ylim([-50, 50]);
xlim([-2*pi, 2*pi]);
grid on

%% arctangent
% Domain:        (-inf, +inf)
% Counterdomain: ( -PI/2, +PI/2 )

y = linspace(-10, 10, 100);
atany = atan(y);
figure
plot(y, atany)
grid on