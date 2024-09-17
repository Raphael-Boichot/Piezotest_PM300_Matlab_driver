clear;
clc;
uiwait(msgbox('Mettre le Piezotest en mode ''Remote'' et insérer une feuille de plastique dans les mors de l''appareil','Success','modal'));
s = serial('COM1','BaudRate',9600,'DataBits',8,'Parity','none','Stopbits',1,'terminator',13);
fopen(s);
s.timeout=1;


k=0;
fprintf(s,'rl');

for i=1:1:20;
    k=k+1;
fprintf(s,'d');
pause(5)
d33(k)=str2double(strtok(fscanf(s), char(12)));
plot(d33,'d')
title(['Mesure du zéro avant calibration : ',num2str(mean(d33(end))),' pC/N'])
ylabel('pC/N')
xlabel('Points de mesure')
end

disp (['La valeure moyenne avant calibration du zéro est de : ',num2str(mean(d33(end-10:end))),' pC/N'])

disp('Application du zéro')
fprintf(s,'sz');
pause(10)
k=0;
d33=0;
for i=1:1:20;
    k=k+1;
fprintf(s,'d');
pause(5)
d33(k)=str2double(strtok(fscanf(s), char(12)));
plot(d33,'d')
title(['Mesure du zéro après calibration : ',num2str(mean(d33(end))),' pC/N'])
ylabel('pC/N')
xlabel('Points de mesure')
end

disp (['La valeure moyenne après calibration du zéro est de : ',num2str(mean(d33(end-10:end))),' pC/N'])

uiwait(msgbox('Mettre l''échantillon de référence (255 pC/N) dans les mors de l''appareil et s''assurer d''avoir une lecture positive','Success','modal'));
pause(10)
k=0;
d33=0;
for i=1:1:20;
    k=k+1;
fprintf(s,'d');
pause(5)
d33(k)=str2double(strtok(fscanf(s), char(12)));
plot(d33,'d')
title(['Mesure de la référence avant calibration : ',num2str(mean(d33(end))),' pC/N'])
ylabel('pC/N')
xlabel('Points de mesure')
end

disp (['La valeure moyenne avant calibration est de : ',num2str(mean(d33(end-10:end))),' pC/N'])

fprintf(s,'cada255');
disp('Application de la consigne de calibration')
pause(10)
k=0;
d33=0;
for i=1:1:20;
    k=k+1;
fprintf(s,'d');
pause(5)
d33(k)=str2double(strtok(fscanf(s), char(12)));
plot(d33,'d')
title(['Mesure de la référence après calibration : ',num2str(mean(d33(end))),' pC/N'])
ylabel('pC/N')
xlabel('Points de mesure')
end

disp (['La valeure moyenne après calibration est de : ',num2str(mean(d33(end-10:end))),' pC/N'])

uiwait(msgbox('Fixer l''échantillon à mesurer, mode VERY LOW RANGE','Success','modal'));
fprintf(s,'rvl');
pause(10)
k=0;
d33=0;
for i=1:1:20;
    k=k+1;
fprintf(s,'d');
pause(5)
d33(k)=str2double(strtok(fscanf(s), char(12)));
plot(d33,'d')
title(['Mesure de l''échantillon : ',num2str(mean(d33(end))),' pC/N'])
ylabel('pC/N')
xlabel('Points de mesure')
end

disp (['La valeure moyenne mesurée est de : ',num2str(mean(d33(end-10:end))),' pC/N'])

fclose(s)
delete(s)
clear s

uiwait(msgbox('Mesure terminée','Success','modal'));
