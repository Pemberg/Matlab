clear all
close all
clc


% VALUES
num_elements=100;
a=2; 
b=3; 
c=1;

a=a*-1;
x=1:1:num_elements; 

% FUNCTIONS
y=a*x+b*randn(1, num_elements); 
y=y+c; 

Y=y'; 
X=x'; 
w=polyfit(x, y, 1); 
ye=polyval(w, x); 

% PLOTS
figure(1) 
plot(x, y, '*'); 
hold on; grid on;
plot(x, ye, 'k'); 
title('Polynomial regression')
legend('values', 'regression')
