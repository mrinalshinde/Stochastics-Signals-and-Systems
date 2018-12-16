clear all
close all
clc

rand('state',0)
randomSequences = rand(1000,2);
randomSeq_1 = randomSequences(:,1);
randomSeq_2 = randomSequences(:,2);
save dat2_1 randomSeq_1 randomSeq_2
sum_Seq = randomSeq_1 + randomSeq_2;
[estimated_sum_seq, location, theoretical_sum_seq] = density (sum_Seq);
plotGraphs(estimated_sum_seq,location,theoretical_sum_seq, ...
    'Density function of sum of uniformly distributed random variables');
display_results(sum_Seq);


function [rho,location,theoretical_sum_seq] = density(randomVariable)
%theoretical
k = 0:.1:2;
for i = length(k) : -1 : 1
    if k(i) <= 1
        theoretical_sum_seq(i) = k(i);
    else
         theoretical_sum_seq(i) = 2 - k(i);
    end
end
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

function display_results(sum_Seq)
fprintf('Mean:')
fprintf('\n Theoretical value = %f', 1)
fprintf('\n Expected value = %s',num2str(mean(sum_Seq)))
fprintf('\n\n Variance:')
fprintf('\n Theoretical value = %f',1/6)
fprintf('\n Estimated value = %s',num2str(var(sum_Seq)))
end