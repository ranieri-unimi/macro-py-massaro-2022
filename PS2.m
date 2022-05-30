%% params
beta = 0.99; % discount factor
alpha = 0.36; % production stuff
delta = 1.0; % depreciation rate
rho = 0.95; % persistence of AR shock
N = 1000;

%% AR1
z = zeros(N);
e = normrnd(0, 0.05, [1,N]);
for t = 2:N
    z(t) = rho*z(t-1) + e(t-1);
end

% plot(z);
% hold on

%% true solution
kss = ((1-beta*(1-delta))/(beta*alpha))^(1/(alpha-1));
k = zeros(N);
k(1) = kss;

for t = 1:N-1
    k(t+1) = alpha*beta*exp(z(t))*(k(t)^alpha);
end

plot(k);
hold on

%% approximate solution
kidx = oo_.dr.inv_order_var(2);  % questo è k
zidx = oo_.dr.inv_order_var(3);  % questo è z
kbar = oo_.dr.ys(2);
zbar = oo_.dr.ys(3);
A = oo_.dr.ghx;
B = oo_.dr.ghu;

khat = zeros(N);
khat(1) = kbar;

for t = 1:N-1
    khat(t+1) = kbar + A(kidx, kidx)*(khat(t) - kbar) + A(kidx, zidx)*(z(t) - zbar) + B(kidx)*(e(t));
end

plot(khat);
hold on
