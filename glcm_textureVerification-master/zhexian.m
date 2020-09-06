% x=0:45:135;
load('label_features.mat','label_features');
a=label_features(:,2);
b=label_features(:,3);
x=label_features(:,1);
% x=[0;45;90;135];
% a=[0.0222 0.765 0.978 0.572];
% b=[0.343 0.0647 0.832 ];
plot(x,a,'-s', x,b,'-s');hold on
xlabel('½Ç¶È');
ylabel('ÄÜÁ¿');
