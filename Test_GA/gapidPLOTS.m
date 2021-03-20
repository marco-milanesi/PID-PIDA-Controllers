clear all, close all, clc

dt = 0.001;
popsize = 200;
MaxGenerations = 1200;
s = tf('s');
G = (1/(1+2*s))*exp(-s)
rng(1,'twister') % for reproducibility

population = rand(popsize,3);
% load randpop.mat

options = optimoptions(@ga,'PopulationSize',popsize,'MaxGenerations',MaxGenerations,'InitialPopulation',population,'OutputFcn',@myfun);
[x,fval,exitflag,output,population,scores] = ga(@(K)pidtest(G,dt,K),3,-eye(3),zeros(3,1),[],[],[],[],[],options);

% %%
% load history.mat
% for k=1:size(cost,2)
%     sortedcost(:,k) = sort(cost(:,k));
% end
% imagesc(log(sortedcost(:,1:size(cost,2))))
% colorbar
% set(gcf,'Position',[100 100 600 300])
% set(gcf,'PaperPositionMode','auto')
% %%
% figure
%     hold on
%     for k=1:size(cost,2)
%         for j=1:popsize
%             scatter3(history(j,1,k),history(j,2,k),history(j,3,k),15,[(size(cost,2)-k)/size(cost,2) 0.25 k/size(cost,2)],'filled');
%         end
%     end
%       [B,I] = sort(cost(:,size(cost,2)));  
%       scatter3(history(I(1),1,size(cost,2)),history(I(1),2,size(cost,2)),history(I(1),3,size(cost,2)),100,[0 0 0],'filled')
%         view(69,24)
%     box on
%     xlabel('Proportional')
%     ylabel('Integral')
%     zlabel('Derivative')
% set(gcf,'Position',[100 100 350 250])
% set(gcf,'PaperPositionMode','auto')
% 
% %% Plot Generation 1
% gen = 1;
% t = 0:dt:50;
% s = tf('s');
%  figure
% hold on
% for k=1:popsize
%     K = history(k,1,gen)*(1 + history(k,2,gen)/s + history(k,3,gen)*s/(1+.001*s));
%     L = series(K,G);
%     CL = feedback(L,1);
%     [y,t] = step(CL,t);
%     plot(t,y,'LineWidth',1.2);
% end
% box on, grid on
% set(gcf,'Position',[100 100 550 250])
% set(gcf,'PaperPositionMode','auto')
% 
% 
% %% Plot Generation 10
% gen = 10;
% t = 0:dt:50;
% s = tf('s');
% figure
% hold on
% for k=1:popsize
%     K = history(k,1,gen)*(1 + history(k,2,gen)/s + history(k,3,gen)*s/(1+.001*s));
%     L = series(K,G);
%     CL = feedback(L,1);
%     [y,t] = step(CL,t);
%     plot(t,y,'LineWidth',1.2);
% end
% box on, grid on
% set(gcf,'Position',[100 100 550 250])
% set(gcf,'PaperPositionMode','auto')
% 
% %% Plot BEST of each Generation
% figure
% for gen=1:size(cost,2)
%     [B,I] = sort(cost(:,gen));
%     K = history(I(1),1,gen)*(1 + history(I(1),2,gen)/s + history(I(1),3,gen)*s/(1+.001*s));
%     L = series(K,G);
%     CL = feedback(L,1);
%     [y,t] = step(CL,t);
%     subplot(3,1,1), hold on
%     plot(t,y,'LineWidth',1+.1*gen,'Color',[(size(cost,2)-gen)/size(cost,2) 0 gen/size(cost,2)],'LineWidth',1.2);
%     box on, grid on
%     subplot(3,1,2), hold on
%     CTRLtf = K/(1+K*G);
%     u = lsim(K,1-y,t);
%     plot(t,u,'LineWidth',1+.1*gen,'Color',[(size(cost,2)-gen)/size(cost,2) 0 gen/size(cost,2)],'LineWidth',1.2);
%     ylim([-1 2])
%     box on, grid on
%     subplot(3,1,3), hold on
%     Q = 1;
%     R = .001;
%     J = dt*cumsum(Q*(1-y(:)).^2 + R*u(:).^2);
%     plot(t,J,'LineWidth',1+.1*gen,'Color',[(size(cost,2)-gen)/size(cost,2) 0 gen/size(cost,2)],'LineWidth',1.2);
% end
% box on, grid on
% set(gcf,'Position',[100 100 550 350])
% set(gcf,'PaperPositionMode','auto')


%%

fval
x

t = 0:dt:50;
K = x(1)*(1 + x(2)/s + x(3)*s/(1+.001*s));
L = series(K,G);
CL = feedback(L,1);
[y,t] = step(CL,t);
plot(t,y,'LineWidth',1.2);
