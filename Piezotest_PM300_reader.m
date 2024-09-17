clear;
clc;
s = serial('COM1','BaudRate',9600,'DataBits',8,'Parity','none','Stopbits',1,'terminator',13);
fopen(s);
s.timeout=1;

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
    title(['Sample d33 : ',num2str(mean(d33(end))),' pC/N'])
    ylabel('pC/N')
    xlabel('Point')
end

disp (['d33 mean value : ',num2str(mean(d33(end-10:end))),' pC/N'])
disp (['d33 standard deviation : ',num2str(std(d33(end-10:end))),' pC/N'])

fclose(s);
delete(s)
clear s

uiwait(msgbox('Termination','Success','modal'));