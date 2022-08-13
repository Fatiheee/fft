fs = 1000;                    
Ts = 1/fs;                     
duration = 3/50;

t = 0 : Ts : duration-Ts;

f = 50;
V = 310;
x = V.*sin(2.*pi.*f.*t);

V5 = V/10.333;
x5 = V5.*sin(2.*pi.*5*f.*t ); %+ (pi.*6)

V7 = V/15.5;
x7 = V7.*sin(2.*pi.*7*f.*t); %( + (2.*pi)./3)

xn = x+x5+x7;

x_fft = abs(fft(x));
v=max(x_fft); x_fft = abs(fft(x))./v;

xn_fft = abs(fft(xn));
vv = max(xn_fft); xn_fft = abs(fft(xn))./vv;

noSamples = length(t);
f = 0 : fs/noSamples : fs - fs/noSamples;
hold on;
grid off;
figure(1);
subplot(2,2,1);
plot(t,x);
xlabel('Zaman(s)');
ylabel('Volt')
subplot(2,2,2);
plot(t,xn);
xlabel('Zaman(s)');
ylabel('Volt')
subplot(2,2,3);
plot(f,x_fft);
xlabel('Frekans(Hz)');
ylabel('Volt')
xlim([0 500]);
subplot(2,2,4);
plot(f,xn_fft);
xlabel('Frekans(Hz)');
ylabel('Volt')
xlim([0 500]);