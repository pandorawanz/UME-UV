data=csvread('D:\uEA-Pico\data\20190104\HEAT300\blank 0.3V 2.4.txt',2,0);
I=data(:,2);
t=data(:,1);
%fs=100;N=128;   %����Ƶ�ʺ����ݵ���
%n=0:N-1;t=n/fs;   %ʱ������
fs=1/(t(100)-t(99)); %����Ƶ��
N=length(I);
n=0:N-1;
%t=n/fs;
%x=0.5*sin(2*pi*15*t)+2*sin(2*pi*40*t); %�ź�
y=fft(I,N);    %���źŽ��п���Fourier�任
mag=abs(y);     %���Fourier�任������
f=n*fs/N;    %Ƶ������
%subplot(2,2,1),plot(f,mag);   %�����Ƶ�ʱ仯�����
%xlabel('Ƶ��/Hz');
%ylabel('���');title('N=128');grid on;
figure(1)
plot(f(1:N/2),mag(1:N/2)); %���NyquistƵ��֮ǰ��Ƶ�ʱ仯�����
xlabel('Ƶ��/Hz');
ylabel('���');title('Ƶ��');grid on;