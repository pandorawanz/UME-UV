data=csvread('D:\uEA-Pico\data\20190104\HEAT300\blank 0.3V 2.4.txt',2,0);
I=data(:,2);
t=data(:,1);
%fs=100;N=128;   %采样频率和数据点数
%n=0:N-1;t=n/fs;   %时间序列
fs=1/(t(100)-t(99)); %采样频率
N=length(I);
n=0:N-1;
%t=n/fs;
%x=0.5*sin(2*pi*15*t)+2*sin(2*pi*40*t); %信号
y=fft(I,N);    %对信号进行快速Fourier变换
mag=abs(y);     %求得Fourier变换后的振幅
f=n*fs/N;    %频率序列
%subplot(2,2,1),plot(f,mag);   %绘出随频率变化的振幅
%xlabel('频率/Hz');
%ylabel('振幅');title('N=128');grid on;
figure(1)
plot(f(1:N/2),mag(1:N/2)); %绘出Nyquist频率之前随频率变化的振幅
xlabel('频率/Hz');
ylabel('振幅');title('频谱');grid on;