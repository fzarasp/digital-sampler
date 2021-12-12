close all
clc
%% part A : generate and plot signal
fsin = 5;
fs = 100;
t = 0 :1/fs : 1;
x = sin(2 * pi * fsin * t);
figure();
plot(t , x);
title('Sin(2\pi5t)');
grid on;
xlabel('time')
ylabel('Amplitude')

%% part B :sampling with Fs = 20Hz. 
fs2 = 20;
x2 = x(1:fs/fs2:length(x));
t2 = 0:1/fs2:1;
figure();
plot(t , x , 'red -*');
hold on ;
plot(t2 , x2, 'blue -o');
legend('main signal', 'sampled signal')
title('Sin(2\pi5t) vs. sampled @ 20Hz');
grid on;
xlabel('time')
ylabel('Amplitude')



%% part C_1 : linear Reconstruction

figure();
plot(t2 , x2, 'blue');
title('linear interpolation @ 20Hz');
grid on;
xlabel('time')
ylabel('Amplitude')


%% part C_2 : sinc Reconstruction

Sinc_len = 2.5;
Interpolation_factor = fs2;
sinc_wave = sinc(-Sinc_len:1/Interpolation_factor:Sinc_len);
sinc_len = length(sinc_wave);
time_len=length(x2);
output_wave_len=time_len*(Interpolation_factor+1);
output_wave_time=0:1/ output_wave_len:1-1/ output_wave_len;
output_wave=zeros(1,output_wave_len);
% sinc interpolation
st=1;
for k=1:time_len
    en=st+sinc_len-1;
    if en>output_wave_len
        break;
    end
    output_wave(st:en)= output_wave(st:en)+ x2(k)*sinc_wave;
    st= st+Interpolation_factor;
end
figure();
plot(output_wave_time,output_wave,'blue');
hold on ;
plot(t , x,'red');
legend('interpolated signal', 'orginal signal')
title('Sin(2\pi5t) vs. interpolated @ 20Hz');
grid on;
xlabel('time')
ylabel('Amplitude')


figure();
plot(output_wave_time,output_wave,'blue');
hold on ;
plot(t2 , x2,'red');
legend('sinc interpolation', 'linear interpolation')
title('Sinc vs. linear interpolation @ 20Hz');
grid on;
xlabel('time')
ylabel('Amplitude')

%% part D-b  : sampling with Fs = 4Hz. 

fs3 = 4;
x3 = x(1:fs/fs3:length(x));
t3 = 0:1/fs3:1;
figure();
plot(t , x , 'red -*');
hold on ;
plot(t3 , x3, 'blue -o');
legend('main signal', 'sampled signal')
title('Sin(2\pi5t) vs. sampled @ 4Hz');
grid on;
xlabel('time')
ylabel('Amplitude')


%% part D - C_1 : linear Reconstruction

figure();
plot(t3 , x3, 'blue');
title('linear interpolation @ 4Hz');
grid on;
xlabel('time')
ylabel('Amplitude')
%% part D-c2 : sinc Reconstruction

Sinc_len2 = 2.5;
Interpolation_factor2 = fs3;
sinc_wave2=sinc(-Sinc_len2:1/Interpolation_factor2:Sinc_len2);
sinc_len2 = length(sinc_wave2);
time_len2=length(x3);
output_wave_len2=time_len2*(Interpolation_factor2+1);
output_wave_time2=0:1/ output_wave_len2:1-1/ output_wave_len2;
output_wave2=zeros(1,output_wave_len2);
st=1;
for k=1:time_len2
    en=st+sinc_len2-1;
    if en>output_wave_len2
       break;
    end
    output_wave2(st:en)= output_wave2(st:en)+ x3(k)*sinc_wave2;
    st= st+Interpolation_factor2;
end

figure();
plot(output_wave_time2,output_wave2,'blue');
hold on ;
plot(t , x,'red');
legend('interpolated signal', 'orginal signal')
title('Sin(2\pi5t) vs. interpolated @ 4Hz');
grid on;
xlabel('time')
ylabel('Amplitude')


figure();
plot(output_wave_time2,output_wave2,'blue');
hold on ;
plot(t3 , x3,'red');
legend('sinc interpolation', 'linear interpolation')
title('Sinc vs. linear interpolation @ 4Hz');
grid on;
xlabel('time')
ylabel('Amplitude')




%% part E : Compare the constructed signals with sinc 
figure();
plot(output_wave_time2,output_wave2,'blue');
hold on ;
plot(output_wave_time,output_wave,'red');
legend('interpolated signal @ 4Hz', 'interpolated signal @ 20Hz')
title('interpolated @ 20Hz vs. interpolated @ 4Hz');
grid on;
xlabel('time')
ylabel('Amplitude')