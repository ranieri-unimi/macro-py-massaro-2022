parameters beta, alpha, delta, rho;
var c, k, z; // endogenous variable
varexo e; // obv exogenous

beta = 0.99; // discount factor
alpha = 0.36; // production stuff
delta = 1.0; // depreciation rate
rho = 0.95; // persistence of AR shock

model;  // model (linear); 
1/c = beta*1/c(+1)*(alpha*k^(alpha-1)* exp(z(+1))+1-delta);
c + k = exp(z)*k(-1)^(alpha)+(1-delta)*k(-1);
z = rho*z(-1)+e;
end;

initval; // variables that are not initialized are set to 0
k = ((1-beta*(1-delta))/(beta*alpha))^(1/(alpha-1));
c = k*(k^(alpha-1)-delta);
z = 0; // theta
e = 0;
end;

shocks;
var e; stderr 0.01;
end;

stoch_simul(order = 1, irf = 100);