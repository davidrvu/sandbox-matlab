amp=10;
fs=20500;  % sampling frequency
duration =0.5;

freq = 50;
while 1
    freq = 50 + freq + rand*354; %#sol

    values=0:1/fs:duration;
    a=amp*sin(2*pi* freq*values);
    sound(a)
end