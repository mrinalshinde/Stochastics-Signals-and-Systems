
clear all;
close all;
clc

randn('state',0); 
z1 = randn(1000,2);
D = [1 0.5; 0 0.5];
z2 = z1 * D;
x = z2(:,1) + 1.5;
y = z2(:,2) + 0.5;
save dat1_3 x y;
if exist('dat1_3.mat','file')
    load dat1_3;
    details = whos(matfile('dat1_3.mat'));
    sprintf('\nVariable: %1s exists',details.name)
else
    fprintf('\n')
    warning('Some error occured')
    return
 end