clear all;
close all;
clc

load fisheriris.mat

in_design_data=meas;
out_design_data=species;
tree=fitctree(in_design_data, out_design_data);

view(tree, 'Mode', 'graph')

%%

in_test=[4.60000000000000	3.60000000000000	1	0.200000000000000;
        5	3.20000000000000	1.20000000000000	0.200000000000000;
        4.40000000000000	3.20000000000000	1.30000000000000	0.200000000000000;
        6.30000000000000	3.30000000000000	4.70000000000000	1.60000000000000];

out_test = ["setosa"; "setosa"; "setosa"; "versicolor"];

test_results=predict(tree, in_test);

precision=sum(test_results==out_test)/length(out_test);
disp(['Accuracy: ' num2str(precision)]);

%%

clear all;
close all;
clc;

load seamount.mat

X = [x y];

figure(1)
plot(X, '*'); grid; hold; plot(z, 'ok')

tree = fitrtree(X,y);

view(tree, 'Mode','graph')

X_test = X;

test_results = predict(tree, X_test);

clc
resuberror = resubLoss(tree);

%% 

clear all;
close all;
clc;

load ionosphere.mat

tree = fitctree(X,Y);

view(tree, 'Mode','graph')

X_test = X;

test_results = predict(tree, X_test);

[~, ~, ~, bestlevel] = cvloss(tree, 'SubTrees', 'All', 'TreeSize', 'min');
view(tree, 'Mode','graph', 'Prune', bestlevel)

tree=prune(tree, 'Level', bestlevel);
view(tree,'Mode','graph')

%% 

clear all;
close all;
clc;

load carsmall.mat

X=[Weight Horsepower];
y=MPG;
figure(1)
plot(X, '*'); grid; hold; plot(y,'ok')

tree = fitrtree(X,y);
view(tree, 'Mode','graph')

X_test = X;

test_results = predict(tree, X_test);

[~, ~, ~, bestlevel] = cvloss(tree, 'SubTrees', 'All', 'TreeSize', 'min');
view(tree, 'Mode','graph', 'Prune', bestlevel)

tree=prune(tree, 'Level', bestlevel);
view(tree,'Mode','graph')

