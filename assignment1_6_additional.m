clear
N_all = round(10.^(1:.5:7));      
r = 1;                            
errors = NaN(size(N_all));     
for k = 1:numel(N_all)            
    N = N_all(k);                 
    x = rand(1,N);            
    y = rand(1,N);           
    r2 = x.^2 + y.^2;             
    area = mean(r2<=r^2)*4;       
    error_all(k) = pi-area;      
end                               
semilogx(N_all, error_all, 'o-','LineWidth',2);
set(gca,'xlabel',text('String', 'length of random sequence', ...
    'FontAngle','italic'),'ylabel',text('String',  ...
    'error (true value - estimated value)', 'FontAngle','italic'), ...
    'FontSize',15)
grid                              