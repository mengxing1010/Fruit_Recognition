load('data_guanxingju.mat','guanxingju');
a=guanxingju(:,2);
b=guanxingju(:,3);
c=guanxingju(:,4);
d=guanxingju(:,5);
e=guanxingju(:,6);
f=guanxingju(:,7);
g=guanxingju(:,8);
h=guanxingju(:,9);
i=guanxingju(:,10);
j=guanxingju(:,11);
k=guanxingju(:,12);
l=guanxingju(:,13);
m=guanxingju(:,14);
n=guanxingju(:,15);
o=guanxingju(:,16);
p=guanxingju(:,17);
q=guanxingju(:,18);
r=guanxingju(:,19);
s=guanxingju(:,20);
t=guanxingju(:,21);

%横坐标
x=guanxingju(:,1);

plot(x,a,'-s',x,b,'-s',x,c,'-s',x,d,'-s',x,e,'-s',x,f,'-s',x,g,'-s',x,h,'-s',x,i,'-s',x,j,'-s',x,k,'-s',x,l,'-s',x,m,'-s',x,n,'-s',x,o,'-s',x,p,'-s',...
    x,q,'-s',x,r,'-s',x,s,'-s',x,t,'-s',x,t,'-s');hold on
xlabel('角度');
ylabel('对比度');