function J = pidtest(G,dt,parms)

s = tf('s');

K = parms(1) + parms(2)/s + (parms(3)*s)/(1 + s*(parms(3)/parms(4))); 
Loop = series(K,G);
ClosedLoop = feedback(Loop,1);

t = 0:dt:20;
[y,t] = step(ClosedLoop,t);

% CTRLtf = K/(1+K*G);
% u = lsim(K,1-y,t);

%  Q = 1;
%  R = .001;
%  J = dt*sum(Q*(1-y(:)).^2 + R*u(:).^2)

J=sum(abs(1-y)*dt);
