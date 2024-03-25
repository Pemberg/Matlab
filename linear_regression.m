clear all
close all
clc


% VALUES
num_elements=100;
a=2;
b=6;
c=3;

a=a*-1;
x=1:1:num_elements;

% FUNCTIONS
y=a*x+b*randn(1,num_elements);
y=y+c;

Y=y';
X=x';
X=[ones(size(X)) X];

B1=y/x;
ye1=B1*x;

B2=X\Y;
ye2=X*B2;

% PLOTS
figure(1)
plot(x,y,"*")
hold on; grid on;
plot(x,ye1, "k")
title('Simple linear regression')
legend("values", 'regression')

figure(2)
plot(x,y,"*")
hold on; grid on;
plot(x,ye2,"k")
title('Simple linear regression')
legend('values', 'regression')

R21=1-sum((y-ye1).^2)/sum((y-mean(y)).^2);
R22=1-sum((y-ye2').^2)/sum((y-mean(y)).^2);