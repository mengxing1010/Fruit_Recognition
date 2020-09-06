load('banana_correlation.mat', 'banana_correlation');
a=banana_correlation(:,2);
b=banana_correlation(:,3);
c=banana_correlation(:,4);
d=banana_correlation(:,5);
e=banana_correlation(:,6);
f=banana_correlation(:,7);
g=banana_correlation(:,8);
h=banana_correlation(:,9);
i=banana_correlation(:,10);
j=banana_correlation(:,11);
k=banana_correlation(:,12);
l=banana_correlation(:,13);
m=banana_correlation(:,14);
n=banana_correlation(:,15);
o=banana_correlation(:,16);
p=banana_correlation(:,17);
q=banana_correlation(:,18);
r=banana_correlation(:,19);
s=banana_correlation(:,20);
t=banana_correlation(:,21);
u=banana_correlation(:,22);
v=banana_correlation(:,23);
w=banana_correlation(:,24);
xx=banana_correlation(:,25);
y=banana_correlation(:,26);
z=banana_correlation(:,27);
aa=banana_correlation(:,28);
ab=banana_correlation(:,29);
ac=banana_correlation(:,30);
ad=banana_correlation(:,31);
%横坐标
x=banana_correlation(:,1);

plot(x,a,'-s',x,b,'-s',x,c,'-s',x,d,'-s',x,e,'-s',x,f,'-s',x,g,'-s',x,h,'-s',x,i,'-s',x,j,'-s',x,k,'-s',x,l,'-s',x,m,'-s',x,n,'-s',x,o,'-s',x,p,'-s',...
    x,q,'-s',x,r,'-s',x,s,'-s',x,t,'-s',x,t,'-s',x,u,'-s',x,v,'-s',x,w,'-s',x,xx,'-s',x,y,'-s',x,z,'-s',x,aa,'-s',x,ab,'-s',x,ac,'-s',x,ad,'-s');hold on
xlabel('角度');
ylabel('相关性');