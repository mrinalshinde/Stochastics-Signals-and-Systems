clear
N_all = round(10.^(1:.5:7));      % Numbers of samples
r = 1;                            % Circle radius
errors = NaN(size(N_all));        % Preallocate result
for k = 1:numel(N_all)            % Loop over size of N_all
    N = N_all(k);                 % Current N
    x = 2*rand(1,N)-1;            % N samples between -1 and 1
    y = 2*rand(1,N)-1;            % N samples between -1 and 1
    r2 = x.^2 + y.^2;             % compute squared distance to origin
    area = mean(r2<=r^2)*4;       % the area is 4 (area of square) times the
                                  % proportion of points in the circle
    error_all(k) = pi-area;       % error in the estimation of pi
end                               % End loop
semilogx(N_all, error_all, 'o-'); % Plot with logarithmic x axis
grid                              % Use grid