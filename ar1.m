% AR(1) process for 1000 lags
 
N = 1000;
X = zeros(N);
phi = -0.3;

for t = 2:N
    e = normrnd(0,1);
    X(t) = phi*X(t-1) + e;
end

plot(X);