clear all
close all
clc

w = randn(1000,1);
x = randn(1000,1);
y = randn(1000,1);
z = randn(1000,1);
save data2_2 w x y z
sum_of_squares_Seq = w.^2+x.^2+y.^2+z.^2;
[estimated_sum_of_squares_Seq, location, theoretical_sum_of_squares_Seq] = ...
    density (sum_of_squares_Seq);
plotGraphs(estimated_sum_of_squares_Seq,location,theoretical_sum_of_squares_Seq, ...
    '\chi^2 uniformly distributed density function');
display_results(sum_of_squares_Seq);


function [rho,location,theoretical_sum_of_squares_Seq] = density(randomVariable)
%theoretical
k = 0 : .5 : 20;
theoretical_sum_of_squares_Seq = (k/4) .* exp(-k/2);
    
%estimated
[height,location] = hist(randomVariable,length(k));  
delta = location(2)-location(1);  
rho = height/(delta*length(randomVariable));  
end

function plotGraphs(rho,location,theoretical,str)
figure()
bar(location,rho,'FaceColor',[0.9290, 0.6940, 0.1250], ...
    'EdgeColor','k','LineWidth',1)
set(gca,'Title',text('String',str,'FontAngle', 'italic', ...
    'FontWeight', 'bold'), ...
         'xlabel',text('String', 'range', 'FontAngle','italic'),...
         'ylabel',text('String', 'density','FontAngle','italic'), ...
         'FontSize',26)
hold on
grid on
plot(location,rho,'r',location,theoretical,'--','LineWidth',3.0);
legend('Estimated value (bar graph)','Estimated value (line graph)', ...
    'Theoritical value');
hold off
end

function display_results(sum_of_squares_Seq)
fprintf('Mean:')
fprintf('\n Theoretical value = %f', 4)
fprintf('\n Expected value = %s',num2str(mean(sum_of_squares_Seq)))
fprintf('\n\n Variance:')
fprintf('\n Theoretical value = %f',8)
fprintf('\n Estimated value = %s',num2str(var(sum_of_squares_Seq)))
end