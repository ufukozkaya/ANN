clear all
close all
clc

K = 100;   % Her Sýnýf için örnek sayýsý
q = 0.51;   % Sýnýflar arasý offset deðeri

A = [rand(1,K)-q;rand(1,K)+q];
B = [rand(1,K)+q;rand(1,K)+q];
C = [rand(1,K)+q;rand(1,K)-q];
D = [rand(1,K)-q;rand(1,K)-q];

figure(1)
plot(A(1,:),A(2,:),'k+','LineWidth',2);
hold on;
grid on;
plot(B(1,:),B(2,:),'bd','LineWidth',2);
plot(C(1,:),C(2,:),'k+','LineWidth',2);
plot(D(1,:),D(2,:),'bd','LineWidth',2);

a = 0;
c = 0;
b = 1;
d = 1;

P = [A B C D];

T = [repmat(a,1,length(A)) repmat(b,1,length(B)) repmat(c,1,length(C)) repmat(d,1,length(D))];

% 2x6x4x1 Að Yapýsý Oluþturuyorum
net = feedforwardnet([4 4]);
net.divideFcn = '';
net.trainParam.goal = 10^-12;
[net,tr,Y,E] = train(net,P,T);
view(net)

span = -1:0.005:2;
[P1,P2] = meshgrid(span,span);
pp = [P1(:) P2(:)]';

aa = net(pp);

figure(2)
mesh(P1,P2,reshape(aa,length(span),length(span))-5);
view(0,90)
colormap summer
hold on
plot(A(1,:),A(2,:),'w+','LineWidth',2);
plot(B(1,:),B(2,:),'bd','LineWidth',2);
plot(C(1,:),C(2,:),'w+','LineWidth',2);
plot(D(1,:),D(2,:),'bd','LineWidth',2);





















