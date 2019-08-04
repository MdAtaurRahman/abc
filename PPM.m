 clc;
 close all;
 clear all;
 fc=20; 
 fm =2;
 fs=1000; 
 t=1;
 n=[0:1/fs:t];
 n=n(1:end-1);
 duty=10;
 per = fs/fc;
 on_t = per/duty;
 s = square(2*pi*fc*n,duty);
 s(find(s<0)) = 0;
 m = sin(2*pi*fm*n);
 
 a=1.25;
 c=a.*sawtooth(2*pi*fc*n);
 ppm=zeros(1,length(s));
 id = find(c>m);
 idd = diff(id);
 iddd = find(idd~=1);
 temp(1) = id(1);
 temp(2:length(iddd)+1) = id(iddd+1);
 for i=1:length(temp)
     ppm (temp(i) : temp(i) + on_t - 1) =1;
 end
 
 subplot(3,1,1);
 plot(n,m,'linewidth',2);
 title('Message signal');
 hold on;
 plot(n,c,'r','linewidth',2);
 grid on;
 subplot(3,1,2);
 plot(n,s,'linewidth',2);
 title('Pulse Train');
 grid on;
 ylim([-0.2 1.2]);
 subplot(3,1,3);
 plot(n,ppm,'linewidth',2);
 title('PPM Signal');
 grid on;
 ylim([-0.2 1.2]);
 
 
 
 
 