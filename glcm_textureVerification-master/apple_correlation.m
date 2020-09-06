load('apple_correlation.mat', 'apple_correlation');
%  apple_correlation=[];
a=apple_correlation(:,2);
b=apple_correlation(:,3);
c=apple_correlation(:,4);
d=apple_correlation(:,5);
e=apple_correlation(:,6);
f=apple_correlation(:,7);
g=apple_correlation(:,8);
h=apple_correlation(:,9);
i=apple_correlation(:,10);
j=apple_correlation(:,11);
k=apple_correlation(:,12);
l=apple_correlation(:,13);
m=apple_correlation(:,14);
n=apple_correlation(:,15);
o=apple_correlation(:,16);
p=apple_correlation(:,17);
q=apple_correlation(:,18);
r=apple_correlation(:,19);
s=apple_correlation(:,20);
t=apple_correlation(:,21);
u=apple_correlation(:,22);
v=apple_correlation(:,23);
w=apple_correlation(:,24);
xx=apple_correlation(:,25);
y=apple_correlation(:,26);
z=apple_correlation(:,27);
aa=apple_correlation(:,28);
ab=apple_correlation(:,29);
ac=apple_correlation(:,30);
ad=apple_correlation(:,31);
%横坐标
x=apple_correlation(:,1);

plot(x,a,'-s',x,b,'-s',x,c,'-s',x,d,'-s',x,e,'-s',x,f,'-s',x,g,'-s',x,h,'-s',x,i,'-s',x,j,'-s',x,k,'-s',x,l,'-s',x,m,'-s',x,n,'-s',x,o,'-s',x,p,'-s',...
    x,q,'-s',x,r,'-s',x,s,'-s',x,t,'-s',x,t,'-s',x,u,'-s',x,v,'-s',x,w,'-s',x,xx,'-s',x,y,'-s',x,z,'-s',x,aa,'-s',x,ab,'-s',x,ac,'-s',x,ad,'-s');hold on
xlabel('角度');
ylabel('相关性');
toc;
disp(['运行时间: ',num2str(toc)]);