clear all
close all
clc

load dat3_1;
plotGraph('Exponential Model', xy1(:,1),xy1(:,2));
plotGraph('Sine Model', xy2(:,1),xy2(:,2));
plotGraph('Polynomial Model', xy3(:,1),xy3(:,2));
plotGraph('Power Model', xy4(:,1),xy4(:,2));

function plotGraph(model,observed_x,observed_y)
if strcmp(model,'Exponential Model') == 1
    expected_value = 2 : 0.1 : 7;
    expected_t = 2.714761*(1.823818.^expected_value);
    compare(expected_value, expected_t, observed_x, observed_y, model);
elseif strcmp(model,'Sine Model') == 1
    expected_value = 0 : 0.1 : 13;
    expected_t = 2.015541*sin(expected_value + 1.008430);
    compare(expected_value, expected_t, observed_x, observed_y, model);
elseif strcmp(model,'Polynomial Model') == 1
    expected_value = 0 : 0.1 : 5;
    expected_t = 4.709133 + 2.477967*expected_value  ...
        + 1.18741*expected_value.^2 - 0.640213766*expected_value.^3;
    compare(expected_value, expected_t, observed_x, observed_y, model);
elseif strcmp(model,'Power Model') == 1
    expected_value = 0 : 0.1 : 5;
    expected_t = 1.354748*(expected_value .^ 0.499158);
    compare(expected_value, expected_t, observed_x, observed_y, model);
end
    function compare(expected_x,expected_y,observed_x,observed_y,model)
        figure()
        hold on
        plot(expected_x, expected_y,'LineWidth',3)
        plot(observed_x,observed_y,'.r','MarkerSize',15)
        hold off
        set(gca,'FontSize',22)
        title(model,'FontAngle', 'italic', 'FontWeight', 'bold')
        legend('estimated','observed')
    end

end
