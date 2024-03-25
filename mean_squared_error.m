clear all 
close all
clc

% VALUES
num_elements=50;
a=2;
b=6;
c=0;

a=a*-1;
x=1:1:num_elements;

% FUNCTIONS
y=a*x+b*randn(1, num_elements);
y=y+c;
Y=y';
X=x';
X=[ones(size(X)) X];

epochs=100;
n=0.1;
A=randn(2, 1);

figure(1); grid; hold;
figure(3); grid; hold;
tic;
for k=1:epochs
    for n_data=1:length(X)
        n=(length(X)/(1+(k*length(X))))*0.00001;
        ye=X(n_data, :)*A;
        e=(Y(n_data, :)-ye);
        D_A=n*e*X(n_data, :);
        A=A+D_A'; 
    end
    
    % noise
    X = X + 0.5 * (randn(size(X)));

    ye=X*A;
    e_epoch = mse(Y, ye);
    figure(1); plot(k, e_epoch, '*r');
    title('Mean squared error');
    figure(3); plot(k, n, 'ok');
    title('Beta value');
end
training_time = toc;

% PLOT
figure;
plot(x, y, '*r'); hold on;
coefficients = polyfit(x, ye, 1);
y_fit = polyval(coefficients, x);
plot(x, y_fit, 'k');
grid on;
title('Regression line');
legend('values', 'regression');