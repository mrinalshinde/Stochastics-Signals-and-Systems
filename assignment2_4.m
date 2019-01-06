clear all
close all
clc

load dat2_1;
product_Seq = randomSeq_1 .* randomSeq_2;
[estimated_product_seq, location, theoretical_product_seq] = density (product_Seq);
plotGraphs(estimated_product_seq,location,theoretical_product_seq, ...
    'Density function of product of uniformly distributed random variables');
display_results(product_Seq);


function [estimated,location,theoretical] = density(randomVariable)
%theoretical
k = 0 : 0.025 : 1;
theoretical =  -log(k);
    
%estimated
[height,location] = hist(randomVariable,length(k));  
delta = location(2)-location(1);  
estimated = height/(delta*length(randomVariable));  

theoretical(1,1) = estimated(1,1);
end

function plotGraphs(estimated,location,theoretical,str)
figure()
bar(location,estimated,'FaceColor',[0.9290, 0.6940, 0.1250], ...
    'EdgeColor','k','LineWidth',1)
set(gca,'Title',text('String',str,'FontAngle', 'italic', ...
    'FontWeight', 'bold'), ...
         'xlabel',text('String', 'range', 'FontAngle','italic'),...
         'ylabel',text('String', 'density','FontAngle','italic'), ...
        'FontSize',26)
hold on
grid on
plot(location,(estimated),'r',location,(theoretical),'--','LineWidth',3.0);
ylim([0 inf])
legend('Estimated value (bar graph)','Estimated value (line graph)', ...
    'Theoritical value');
hold off
end

function display_results(dist)
fprintf('Mean:')
fprintf('\n Theoretical value = %f', 1/4)
fprintf('\n Expected value = %s',num2str(mean(dist)))
fprintf('\n\n Variance:')
fprintf('\n Theoretical value = %f',7/144)
fprintf('\n Estimated value = %s',num2str(var(dist)))
end