load('apple_contrast.mat', 'apple_contrast');
%  apple_contrast=[];
a=apple_contrast(:,2);
b=apple_contrast(:,3);
c=apple_contrast(:,4);
d=apple_contrast(:,5);
e=apple_contrast(:,6);
f=apple_contrast(:,7);
g=apple_contrast(:,8);
h=apple_contrast(:,9);
i=apple_contrast(:,10);
j=apple_contrast(:,11);
k=apple_contrast(:,12);
l=apple_contrast(:,13);
m=apple_contrast(:,14);
n=apple_contrast(:,15);
o=apple_contrast(:,16);
p=apple_contrast(:,17);
q=apple_contrast(:,18);
r=apple_contrast(:,19);
s=apple_contrast(:,20);
t=apple_contrast(:,21);
u=apple_contrast(:,22);
v=apple_contrast(:,23);
w=apple_contrast(:,24);
xx=apple_contrast(:,25);
y=apple_contrast(:,26);
z=apple_contrast(:,27);
aa=apple_contrast(:,28);
ab=apple_contrast(:,29);
ac=apple_contrast(:,30);
ad=apple_contrast(:,31);
%横坐标
x=apple_contrast(:,1);

plot(x,a,'-s',x,b,'-s',x,c,'-s',x,d,'-s',x,e,'-s',x,f,'-s',x,g,'-s',x,h,'-s',x,i,'-s',x,j,'-s',x,k,'-s',x,l,'-s',x,m,'-s',x,n,'-s',x,o,'-s',x,p,'-s',...
    x,q,'-s',x,r,'-s',x,s,'-s',x,t,'-s',x,t,'-s',x,u,'-s',x,v,'-s',x,w,'-s',x,xx,'-s',x,y,'-s',x,z,'-s',x,aa,'-s',x,ab,'-s',x,ac,'-s',x,ad,'-s');hold on
xlabel('角度');
ylabel('对比度');