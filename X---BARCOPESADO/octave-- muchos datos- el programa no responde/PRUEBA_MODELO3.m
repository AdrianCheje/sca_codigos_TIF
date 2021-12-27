clc
clear all
close all
%history -c
tmax=300
time=0:0.1:tmax;




x0=[0 0 0 0 0 0]
nd=[700 700 pi/2];



[time1 estados] = ode45(@(t,x)modelo3(t,x,nd),time,x0);


figure(1),plot(time1,estados(:,1))
figure(3),plot(time1,estados(:,3))
figure(5),plot(time1,estados(:,5))
x1=estados(:,1);
x2=estados(:,2);
x3=estados(:,3);
x4=estados(:,4);
x5=estados(:,5);
x6=estados(:,6);

ndx=[nd(:,1).*ones(size(time1)) nd(:,2).*ones(size(time1)) nd(:,3).*ones(size(time1)) ]

dotnd=[cos(x5).*8 sin(x5).*8 0.0033.*pi.*ones(size(x5))];
ddotnd=[zeros(size(time1)) zeros(size(time1)) zeros(size(time1))];


tao1=(22680000.*x6 - (7560800.*x2.*sin(x5))./(cos(x5).^2 + sin(x5).^2) + (7560800.*x4.*cos(x5))./(cos(x5).^2 + sin(x5).^2)).*(dotnd(:,3) + nd(:,3) - x5 - x6) - ((51380.*sin(x5))./(cos(x5).^2 + sin(x5).^2) + (x6.*cos(x5).*((4509600.*cos(x5).^2)./(cos(x5).^2 + sin(x5).^2) + (4509600.*sin(x5).^2)./(cos(x5).^2 + sin(x5).^2)))./(cos(x5).^2 + sin(x5).^2)).*(dotnd(:,2) + nd(:,2) - x3 - x4) - ((51380.*cos(x5))./(cos(x5).^2 + sin(x5).^2) - (x6.*sin(x5).*((4509600.*cos(x5).^2)./(cos(x5).^2 + sin(x5).^2) + (4509600.*sin(x5).^2)./(cos(x5).^2 + sin(x5).^2)))./(cos(x5).^2 + sin(x5).^2)).*(dotnd(:,1) + nd(:,1) - x1 - x2) - (dotnd(:,3) + nd(:,3) - x5).*(22680000.*x6 - (7560800.*x2.*sin(x5))./(cos(x5).^2 + sin(x5).^2) + (7560800.*x4.*cos(x5))./(cos(x5).^2 + sin(x5).^2)) + (22548.*cos(x5).*(dotnd(:,1) + nd(:,1) - x1 - x2))./(5.*(cos(x5).^2 + sin(x5).^2)) + (45096.*sin(x5).*(dotnd(:,2) + nd(:,2) - x3 - x4))./(5.*(cos(x5).^2 + sin(x5).^2)) + (4509600.*cos(x5).*(ddotnd(:,1) + dotnd(:,1) - x2))./(cos(x5).^2 + sin(x5).^2) + (51380.*cos(x5).*(dotnd(:,1) + nd(:,1) - x1))./(cos(x5).^2 + sin(x5).^2) + (4509600.*sin(x5).*(ddotnd(:,2) + dotnd(:,2) - x4))./(cos(x5).^2 + sin(x5).^2) + (51380.*sin(x5).*(dotnd(:,2) + nd(:,2) - x3))./(cos(x5).^2 + sin(x5).^2) + (4509600.*x6.*cos(x5).*(cos(x5).^2./(cos(x5).^2 + sin(x5).^2) + sin(x5).^2./(cos(x5).^2 + sin(x5).^2)).*(dotnd(:,2) + nd(:,2) - x3))./(cos(x5).^2 + sin(x5).^2) - (4509600.*x6.*sin(x5).*(cos(x5).^2./(cos(x5).^2 + sin(x5).^2) + sin(x5).^2./(cos(x5).^2 + sin(x5).^2)).*(dotnd(:,1) + nd(:,1) - x1))./(cos(x5).^2 + sin(x5).^2);
tao2=22680000.*ddotnd(:,3) + 21353340.*dotnd(:,3) - 1326660.*nd(:,3) + 1326660.*x5 - 22861440.*x6 + ((169800.*sin(x5))./(cos(x5).^2 + sin(x5).^2) + (x6.*cos(x5).*((7560800.*cos(x5).^2)./(cos(x5).^2 + sin(x5).^2) + (7560800.*sin(x5).^2)./(cos(x5).^2 + sin(x5).^2)))./(cos(x5).^2 + sin(x5).^2)).*(dotnd(:,1) + nd(:,1) - x1 - x2) - ((169800.*cos(x5))./(cos(x5).^2 + sin(x5).^2) - (x6.*sin(x5).*((7560800.*cos(x5).^2)./(cos(x5).^2 + sin(x5).^2) + (7560800.*sin(x5).^2)./(cos(x5).^2 + sin(x5).^2)))./(cos(x5).^2 + sin(x5).^2)).*(dotnd(:,2) + nd(:,2) - x3 - x4) - ((4509600.*x4.*sin(x5))./(cos(x5).^2 + sin(x5).^2) + (4509600.*x2.*cos(x5))./(cos(x5).^2 + sin(x5).^2) - 1508100).*(dotnd(:,3) + nd(:,3) - x5 - x6) + ((4509600.*x4.*sin(x5))./(cos(x5).^2 + sin(x5).^2) + (4509600.*x2.*cos(x5))./(cos(x5).^2 + sin(x5).^2)).*(dotnd(:,3) + nd(:,3) - x5) + (75608.*cos(x5).*(dotnd(:,2) + nd(:,2) - x3 - x4))./(5.*(cos(x5).^2 + sin(x5).^2)) - (37804.*sin(x5).*(dotnd(:,1) + nd(:,1) - x1 - x2))./(5.*(cos(x5).^2 + sin(x5).^2)) + (7560800.*cos(x5).*(ddotnd(:,2) + dotnd(:,2) - x4))./(cos(x5).^2 + sin(x5).^2) + (169800.*cos(x5).*(dotnd(:,2) + nd(:,2) - x3))./(cos(x5).^2 + sin(x5).^2) - (7560800.*sin(x5).*(ddotnd(:,1) + dotnd(:,1) - x2))./(cos(x5).^2 + sin(x5).^2) - (169800.*sin(x5).*(dotnd(:,1) + nd(:,1) - x1))./(cos(x5).^2 + sin(x5).^2) - (7560800.*x6.*cos(x5).*(cos(x5).^2./(cos(x5).^2 + sin(x5).^2) + sin(x5).^2./(cos(x5).^2 + sin(x5).^2)).*(dotnd(:,1) + nd(:,1) - x1))./(cos(x5).^2 + sin(x5).^2) - (7560800.*x6.*sin(x5).*(cos(x5).^2./(cos(x5).^2 + sin(x5).^2) + sin(x5).^2./(cos(x5).^2 + sin(x5).^2)).*(dotnd(:,2) + nd(:,2) - x3))./(cos(x5).^2 + sin(x5).^2);
tao3=2968300000.*ddotnd(:,3) + 2992046400.*dotnd(:,3) + 23746400.*nd(:,3) - 23746400.*x5 - 2739046400.*x6 + ((cos(x5).*(dotnd(:,1) + nd(:,1) - x1))./(cos(x5).^2 + sin(x5).^2) + (sin(x5).*(dotnd(:,2) + nd(:,2) - x3))./(cos(x5).^2 + sin(x5).^2)).*(22680000.*x6 - (7560800.*x2.*sin(x5))./(cos(x5).^2 + sin(x5).^2) + (7560800.*x4.*cos(x5))./(cos(x5).^2 + sin(x5).^2)) - ((4509600.*x4.*sin(x5))./(cos(x5).^2 + sin(x5).^2) + (4509600.*x2.*cos(x5))./(cos(x5).^2 + sin(x5).^2)).*((cos(x5).*(dotnd(:,2) + nd(:,2) - x3))./(cos(x5).^2 + sin(x5).^2) - (sin(x5).*(dotnd(:,1) + nd(:,1) - x1))./(cos(x5).^2 + sin(x5).^2)) + ((1508100.*cos(x5))./(cos(x5).^2 + sin(x5).^2) - (sin(x5).*(22680000.*x6 - x6.*((22680000.*cos(x5).^2)./(cos(x5).^2 + sin(x5).^2) + (22680000.*sin(x5).^2)./(cos(x5).^2 + sin(x5).^2)) - (7560800.*x2.*sin(x5))./(cos(x5).^2 + sin(x5).^2) + (7560800.*x4.*cos(x5))./(cos(x5).^2 + sin(x5).^2)))./(cos(x5).^2 + sin(x5).^2) + (cos(x5).*((4509600.*x4.*sin(x5))./(cos(x5).^2 + sin(x5).^2) + (4509600.*x2.*cos(x5))./(cos(x5).^2 + sin(x5).^2)))./(cos(x5).^2 + sin(x5).^2)).*(dotnd(:,2) + nd(:,2) - x3 - x4) - ((1508100.*sin(x5))./(cos(x5).^2 + sin(x5).^2) + (cos(x5).*(22680000.*x6 - x6.*((22680000.*cos(x5).^2)./(cos(x5).^2 + sin(x5).^2) + (22680000.*sin(x5).^2)./(cos(x5).^2 + sin(x5).^2)) - (7560800.*x2.*sin(x5))./(cos(x5).^2 + sin(x5).^2) + (7560800.*x4.*cos(x5))./(cos(x5).^2 + sin(x5).^2)))./(cos(x5).^2 + sin(x5).^2) + (sin(x5).*((4509600.*x4.*sin(x5))./(cos(x5).^2 + sin(x5).^2) + (4509600.*x2.*cos(x5))./(cos(x5).^2 + sin(x5).^2)))./(cos(x5).^2 + sin(x5).^2)).*(dotnd(:,1) + nd(:,1) - x1 - x2) + (45360.*cos(x5).*(dotnd(:,2) + nd(:,2) - x3 - x4))./(cos(x5).^2 + sin(x5).^2) - (22680.*sin(x5).*(dotnd(:,1) + nd(:,1) - x1 - x2))./(cos(x5).^2 + sin(x5).^2) + (22680000.*cos(x5).*(ddotnd(:,2) + dotnd(:,2) - x4))./(cos(x5).^2 + sin(x5).^2) - (1508100.*cos(x5).*(dotnd(:,2) + nd(:,2) - x3))./(cos(x5).^2 + sin(x5).^2) - (22680000.*sin(x5).*(ddotnd(:,1) + dotnd(:,1) - x2))./(cos(x5).^2 + sin(x5).^2) + (1508100.*sin(x5).*(dotnd(:,1) + nd(:,1) - x1))./(cos(x5).^2 + sin(x5).^2) - (22680000.*x6.*cos(x5).*(cos(x5).^2./(cos(x5).^2 + sin(x5).^2) + sin(x5).^2./(cos(x5).^2 + sin(x5).^2)).*(dotnd(:,1) + nd(:,1) - x1))./(cos(x5).^2 + sin(x5).^2) - (22680000.*x6.*sin(x5).*(cos(x5).^2./(cos(x5).^2 + sin(x5).^2) + sin(x5).^2./(cos(x5).^2 + sin(x5).^2)).*(dotnd(:,2) + nd(:,2) - x3))./(cos(x5).^2 + sin(x5).^2);
 
 
 %------tao2=-M_n.*K.*[sgn]
 
sd1=x2-(dotnd(:,1)-(x1-nd(:,1)));
sd2=x4-(dotnd(:,2)-(x3-nd(:,2)));
sd3=x6-(dotnd(:,3)-(x5-nd(:,3)));
 
 
 cc1=-(22548.*cos(x5))./(5.*(cos(x5).^2 + sin(x5).^2));
 cc2=-(22548.*sin(x5))./(5.*(cos(x5).^2 + sin(x5).^2));
 cc3=0;
 cc4=(37804.*sin(x5))./(5.*(cos(x5).^2 + sin(x5).^2));
 cc5=-(37804.*cos(x5))./(5.*(cos(x5).^2 + sin(x5).^2));
 cc6=-22680;
 cc7=(22680.*sin(x5))./(cos(x5).^2 + sin(x5).^2);
 cc8=-(22680.*cos(x5))./(cos(x5).^2 + sin(x5).^2);
 cc9=-2968300;
 
 tao11=[cc1.*sign(sd1)+cc2.*sign(sd2)+cc3.*sign(sd3)] ;
 tao22=[cc4.*sign(sd1)+ cc5.*sign(sd2)+ cc6.*sign(sd3)];
 tao33=[cc7.*sign(sd1)+ cc8.*sign(sd2)+ cc9.*sign(sd3)];
 
 
 %%Ley de control general
 
 taox=tao1+tao11
 taoy=tao2+tao22
 taopsi=tao3+tao33


figure(2),plot(time1,estados(:,2))
figure(4),plot(time1,estados(:,4))
figure(6),plot(time1,estados(:,6))

%calculo de las velocidades 
figure(7),plot((estados(:,3)),estados(:,1))






figure(11),plot(time1,taox)
figure(12),plot(time1,taoy)
figure(13),plot(time1,taopsi)


