clc;clear;
%% Function test code
% x = -2:0.1:2;
% y = -2:0.1:2;
% z = zeros(size(x,2),size(y,2));
% for row = 1:size(x,2)
%     for col = 1:size(y,2)
%         z(row,col) = RosenbrockFunction([x(row) y(col)]);
%     end
% end
% surf(x,y,z);

disp('Start test');
h1 = zeros(1,50);
h2 = zeros(1,50);
h3 = zeros(1,50);
h4 = zeros(1,50);
h5 = zeros(1,50);
h6 = zeros(1,50);
h7 = zeros(1,50);
h8 = zeros(1,50);
h9 = zeros(1,50);
h10 = zeros(1,50);
h11 = zeros(1,50);
h12 = zeros(1,50);
%% Generate Initial Point
for i = 1:20
    p1 = MakeInitialPoint([10,-10,10,-10],10);
    p2 = MakeInitialPoint([5,-5,5,-5],10);
    p3 = MakeInitialPoint([600,-600,600,-600],10);
    p4 = MakeInitialPoint([5,-5,5,-5],10);
    p5 = MakeInitialPoint([3,-3,3,-3],10);
    p6 = MakeInitialPoint([10,-10,10,-10],10);

    %% PSO test code
    %Gaussian Function
    [optF1, optX1, history1] = PSO_continious_2D(@GaussianFunction,10,p1);
    %Ackley Function
    [optF2, optX2, history2] = PSO_continious_2D(@AckleyFunction,10,p2);
    %Griewank Function
    [optF3, optX3, history3] = PSO_continious_2D(@GriewankFunction,10,p3);
    %Rastrigin Function
    [optF4, optX4, history4] = PSO_continious_2D(@RastriginFunction,10,p4);
    %Rosenbrock Function
    [optF5, optX5, history5] = PSO_continious_2D(@RosenbrockFunction,10,p5);
    %Schaffer Function
    [optF6, optX6, history6] = PSO_continious_2D(@SchafferFunction,10,p6);

    %% PSO_optimal test code
    %Gaussian Function
    [optF7, optX7, history7] = PSO_continious_2D_optimal(@GaussianFunction,10,p1);
    %Ackley Function
    [optF8, optX8, history8] = PSO_continious_2D_optimal(@AckleyFunction,10,p2);
    %Griewank Function
    [optF9, optX9, history9] = PSO_continious_2D_optimal(@GriewankFunction,10,p3);
    %Rastrigin Function
    [optF10, optX10, history10] = PSO_continious_2D_optimal(@RastriginFunction,10,p4);
    %Rosenbrock Function
    [optF11, optX11, history11] = PSO_continious_2D_optimal(@RosenbrockFunction,10,p5);
    %Schaffer Function
    [optF12, optX12, history12] = PSO_continious_2D_optimal(@SchafferFunction,10,p6);
    h1 = h1+history1./20;
    h2 = h2+history2./20;
    h3 = h3+history3./20;
    h4 = h4+history4./20;
    h5 = h5+history5./20;
    h6 = h6+history6./20;
    h7 = h7+history7./20;
    h8 = h8+history8./20;
    h9 = h9+history9./20;
    h10 = h10+history10./20;
    h11 = h11+history11./20;
    h12 = h12+history12./20;
end
%% Show result
tic
plot(h1,'r--');title('Gaussian Function');
xlabel('迭代次数');ylabel('适应度值');
hold on
plot(h7,'b-');
legend('PSO','优化的算法');
figure;

plot(h2,'r--');title('Ackley Function');
xlabel('迭代次数');ylabel('适应度值');
hold on
plot(h8,'b-');
legend('PSO','优化的算法');
figure;

plot(h3,'r--');title('Griewank Function');
xlabel('迭代次数');ylabel('适应度值');
hold on
plot(h9,'b-');
legend('PSO','优化的算法');
figure;

plot(h4,'r--');title('Rastrigin Function');
xlabel('迭代次数');ylabel('适应度值');
hold on
plot(h10,'b-');
legend('PSO','优化的算法');
figure;

plot(h5,'r--');title('Rosenbrock Function');
xlabel('迭代次数');ylabel('适应度值');
% set(0,'defaultfigurecolor','w');
hold on
plot(h11,'b-');
legend('PSO','优化的算法');
figure;

plot(h6,'r--');title('Schaffer Function');
xlabel('迭代次数');ylabel('适应度值');
hold on
plot(h12,'b-');
legend('PSO','优化的算法');
toc;
disp(['运行时间: ',num2str(toc)]);