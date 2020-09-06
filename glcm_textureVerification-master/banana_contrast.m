 load('banana_contrast.mat', 'banana_contrast');
a=banana_contrast(:,2);
b=banana_contrast(:,3);
c=banana_contrast(:,4);
d=banana_contrast(:,5);
e=banana_contrast(:,6);
f=banana_contrast(:,7);
g=banana_contrast(:,8);
h=banana_contrast(:,9);
i=banana_contrast(:,10);
j=banana_contrast(:,11);
k=banana_contrast(:,12);
l=banana_contrast(:,13);
m=banana_contrast(:,14);
n=banana_contrast(:,15);
o=banana_contrast(:,16);
p=banana_contrast(:,17);
q=banana_contrast(:,18);
r=banana_contrast(:,19);
s=banana_contrast(:,20);
t=banana_contrast(:,21);
u=banana_contrast(:,22);
v=banana_contrast(:,23);
w=banana_contrast(:,24);
xx=banana_contrast(:,25);
y=banana_contrast(:,26);
z=banana_contrast(:,27);
aa=banana_contrast(:,28);
ab=banana_contrast(:,29);
ac=banana_contrast(:,30);
ad=banana_contrast(:,31);
%横坐标
x=banana_contrast(:,1);

plot(x,a,'-s',x,b,'-s',x,c,'-s',x,d,'-s',x,e,'-s',x,f,'-s',x,g,'-s',x,h,'-s',x,i,'-s',x,j,'-s',x,k,'-s',x,l,'-s',x,m,'-s',x,n,'-s',x,o,'-s',x,p,'-s',...
    x,q,'-s',x,r,'-s',x,s,'-s',x,t,'-s',x,t,'-s',x,u,'-s',x,v,'-s',x,w,'-s',x,xx,'-s',x,y,'-s',x,z,'-s',x,aa,'-s',x,ab,'-s',x,ac,'-s',x,ad,'-s');hold on
xlabel('角度');
ylabel('对比度');