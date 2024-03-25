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
X=[ones(size(X)) X];

xm=sum(x)/length(x);
ym=sum(y)/length(y);

a1=(sum((x-xm) .* (y-ym)))/(sum((x-xm).^2));
a0=ym-(a1*xm);

B3=[a0; a1];
ye3=X*B3;

% PLOTS
figure(1)
plot(x, y, "*")
hold on; grid on;
plot(x, ye3, "k")
title('Min squares regression')
legend('values', 'regression')

R23=1-sum((y-ye3').^2)/sum((y-mean(y)).^2);