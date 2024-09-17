clear;
clc;
uiwait(msgbox('Set the piezotest in ''Remote'' Mode and mount a cardboard between the jaws','Success','modal'));
s = serial('COM1','BaudRate',9600,'DataBits',8,'Parity','none','Stopbits',1,'terminator',13);
fopen(s);
s.timeout=1;

k=0;
fprintf(s,'rl');

for i=1:1:20
    k=k+1;
    fprintf(s,'d');
    pause(5)
    d33(k)=str2double(strtok(fscanf(s), char(12)));
    plot(d33,'d')
    title(['Measuring the ref for zero before calibration : ',num2str(mean(d33(end))),' pC/N'])
    ylabel('pC/N')
    xlabel('Measurements')
end

disp (['Before calibration, the zero is : ',num2str(mean(d33(end-10:end))),' pC/N'])

disp('Zeroing the device...')
fprintf(s,'sz');
pause(10)
k=0;
d33=0;
for i=1:1:20
    k=k+1;
    fprintf(s,'d');
    pause(5)
    d33(k)=str2double(strtok(fscanf(s), char(12)));
    plot(d33,'d')
    title(['Measuring the ref for zero after calibration : ',num2str(mean(d33(end))),' pC/N'])
    ylabel('pC/N')
    xlabel('Measurements')
end

disp (['Mean value for zero after calibration : ',num2str(mean(d33(end-10:end))),' pC/N'])

uiwait(msgbox('Mount the calibration sample (255 pC/N) and check for positive reading','Success','modal'));
pause(10)
k=0;
d33=0;
for i=1:1:20
    k=k+1;
    fprintf(s,'d');
    pause(5)
    d33(k)=str2double(strtok(fscanf(s), char(12)));
    plot(d33,'d')
    title(['Measuring the reference before calibration : ',num2str(mean(d33(end))),' pC/N'])
    ylabel('pC/N')
    xlabel('Measurements')
end

disp (['The mean value before calibration is : ',num2str(mean(d33(end-10:end))),' pC/N'])

fprintf(s,'cada255');
disp('Calibrating the device...')
pause(10)
k=0;
d33=0;
for i=1:1:20;
    k=k+1;
    fprintf(s,'d');
    pause(5)
    d33(k)=str2double(strtok(fscanf(s), char(12)));
    plot(d33,'d')
    title(['Measuring the reference after calibration : ',num2str(mean(d33(end))),' pC/N'])
    ylabel('pC/N')
    xlabel('Measurements')
end

disp (['The mean value after calibration is : ',num2str(mean(d33(end-10:end))),' pC/N'])

uiwait(msgbox('Mount the sample, mode VERY LOW RANGE','Success','modal'));
fprintf(s,'rvl');
pause(10)
k=0;
d33=0;
for i=1:1:20
    k=k+1;
    fprintf(s,'d');
    pause(5)
    d33(k)=str2double(strtok(fscanf(s), char(12)));
    plot(d33,'d')
    title(['d33 value : ',num2str(mean(d33(end))),' pC/N'])
    ylabel('pC/N')
    xlabel('Measurements')
end

disp (['d33 mean value : ',num2str(mean(d33(end-10:end))),' pC/N'])

fclose(s);
delete(s)
clear s

uiwait(msgbox('Termination','Success','modal'));
