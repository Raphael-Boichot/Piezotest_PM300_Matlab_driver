clear;
clc;
uiwait(msgbox('Set the piezotest in ''Remote'' Mode and mount a cardboard between the jaws','Success','modal'));
s = serial('COM1','BaudRate',9600,'DataBits',8,'Parity','none','Stopbits',1,'terminator',13);
fopen(s);
s.timeout=1;


k=0;
fprintf(s,'rl');

for i=1:1:10;
    k=k+1;
fprintf(s,'d');
pause(5)
d33(k)=str2double(strtok(fscanf(s), char(12)));
d33(end)
plot(d33,'d')
end

fprintf(s,'sz');

uiwait(msgbox('Mount the calibration sample (255 pC/N) and check for positive reading','Success','modal'));

for i=1:1:10;
    k=k+1;
fprintf(s,'d');
pause(5)
d33(k)=str2double(strtok(fscanf(s), char(12)));
d33(end)
plot(d33,'d')
end

fprintf(s,'cada255');

uiwait(msgbox('Calibration checking','Success','modal'));

for i=1:1:10;
    k=k+1;
fprintf(s,'d');
pause(5)
d33(k)=str2double(strtok(fscanf(s), char(12)));
d33(end)
plot(d33,'d')
end

uiwait(msgbox('Calibration terminated','Success','modal'));


fclose(s)
delete(s)
clear s


