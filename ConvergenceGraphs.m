clear all;
clc;
close all;

load GDPpc_1870_2018.mat
%% Baumol sample
% Japan, Finland, Sweden, Norway, Germany, Italy, Austria, France, Canada, 
% Denmark, the United States, the Netherlands, Switzerland, Belgium, 
% the United Kingdom, and Australia
Tstart=1870;
Tend=1979;

sample=[35, 20, 56, 44, 14, 32, 4, 21, 8, 15, 63, 43, 9, 5, 22, 3]; % 

for i=1:length(sample)
% X axis: log(GDPpc)
X(i,1)=log(BarroEq(sample(i),1));
% Y axis: log(GDPpc2018/GDPpc1870)
if Tend==1979
    j=2;
elseif Tend==2018
    j=3;
else
    disp('Elige entre 1979 y 2018 únicamente');
end
Y(i,1)=log(BarroEq(sample(i),j)./BarroEq(sample(i),1));
end
[~,Yhat1]=ols(Y,X,1,0.05);
Tend=2018;
for i=1:length(sample)
% X axis: log(GDPpc)
X2(i,1)=log(BarroEq(sample(i),1));
% Y axis: log(GDPpc2018/GDPpc1870)
if Tend==1979
    j=2;
elseif Tend==2018
    j=3;
else
    disp('Elige entre 1979 y 2018 únicamente');
end
Y2(i,1)=log(BarroEq(sample(i),j)./BarroEq(sample(i),1));
end
[~,Yhat2]=ols(Y2,X2,1,0.05);
%%%%%%%%%%
figure(1)
scatter(X,Y,'MarkerEdgeColor',[234, 84, 85]/255,...
            'MarkerFaceColor',[234, 84, 85]/255,...
            'LineWidth',0.75);
hold on;
scatter(X2,Y2,'MarkerEdgeColor',[48, 71, 94]/255,...
              'MarkerFaceColor',[48, 71, 94]/255,...
              'LineWidth',0.75);
plot(X,Yhat1,'k','LineWidth',0.75);
plot(X,Yhat2,'k','LineWidth',0.75);
hold off;
xlabel('Log del PIB en 1870','FontName','Serif','FontSize', 14)
ylabel('Diferencia logarítmica','FontName','Serif','FontSize', 14)
title('Muestra de Baumol','FontName','Serif','FontSize', 14)
legend('1870-1979','1870-2018')
saveas(gcf,'Baumol','epsc');
%% De Long sample
% Finland, Sweden, Norway, Germany, Italy, Austria, France, Canada, 
% Denmark, the United States, the Netherlands, Switzerland, Belgium, 
% the United Kingdom, and Australia
% Argentina, Chile, East Germany, Ireland, New Zealand, Portugal, and Spain.
Tstart=1870;
Tend=1979;

sample=[20, 56, 44, 14, 32, 4, 21, 8, 15, 63, 43, 9, 5,...
    22, 3, 2, 10, 29, 46, 51, 19]; % 

for i=1:length(sample)
% X axis: log(GDPpc)
X3(i,1)=log(BarroEq(sample(i),1));
% Y axis: log(GDPpc2018/GDPpc1870)
if Tend==1979
    j=2;
elseif Tend==2018
    j=3;
else
    disp('Elige entre 1979 y 2018 únicamente');
end
Y3(i,1)=log(BarroEq(sample(i),j)./BarroEq(sample(i),1));
end
[~,Yhat3]=ols(Y3,X3,1,0.05);
Tend=2018;
for i=1:length(sample)
% X axis: log(GDPpc)
X4(i,1)=log(BarroEq(sample(i),1));
% Y axis: log(GDPpc2018/GDPpc1870)
if Tend==1979
    j=2;
elseif Tend==2018
    j=3;
else
    disp('Elige entre 1979 y 2018 únicamente');
end
Y4(i,1)=log(BarroEq(sample(i),j)./BarroEq(sample(i),1));
end
[~,Yhat4]=ols(Y4,X4,1,0.05);
%%%%%%%%%%
figure(2)
scatter(X,Y,'MarkerEdgeColor',[234, 84, 85]/255,...
            'MarkerFaceColor',[234, 84, 85]/255,...
            'LineWidth',0.75);
hold on;
scatter(X3,Y3,'MarkerEdgeColor',[234, 84, 85]/255,...
            'LineWidth',0.75);        
scatter(X2,Y2,'MarkerEdgeColor',[48, 71, 94]/255,...
            'MarkerFaceColor',[48, 71, 94]/255,...
            'LineWidth',0.75);
scatter(X4,Y4,'MarkerEdgeColor',[48, 71, 94]/255,...  
              'LineWidth',0.75);        
plot(X3,Yhat3,'k','LineWidth',0.75);
plot(X4,Yhat4,'k','LineWidth',0.75);
hold off;
xlabel('Log del PIB en 1870','FontName','Serif','FontSize', 14)
ylabel('Diferencia logarítmica','FontName','Serif','FontSize', 14)
title('Muestra de De Long','FontName','Serif','FontSize', 14)
legend('1870-1979','1870-1979: nuevos países','1870-2018','1870-2018: nuevos países')
saveas(gcf,'DeLong','epsc');
%% Maddison sample

Tstart=1870;
Tend=1979;
% X axis: log(GDPpc)
X5(:,1)=log(BarroEq(:,1));
% Y axis: log(GDPpc2018/GDPpc1870)
Y5(:,1)=log(BarroEq(:,2)./BarroEq(:,1));
[~,Yhat5]=ols(Y5,X5,1,0.05);

Tend=2018;
% X axis: log(GDPpc)
X6(:,1)=log(BarroEq(:,1));
% Y axis: log(GDPpc2018/GDPpc1870)
Y6(:,1)=log(BarroEq(:,3)./BarroEq(:,1));
[~,Yhat6]=ols(Y6,X6,1,0.05);
%%%%%%%%%%
figure(3)
scatter(X3,Y3,'MarkerEdgeColor',[234, 84, 85]/255,...
            'MarkerFaceColor',[234, 84, 85]/255,...
            'LineWidth',0.75);
hold on;
scatter(X5,Y5,'MarkerEdgeColor',[234, 84, 85]/255,...
            'LineWidth',0.75);        
scatter(X4,Y4,'MarkerEdgeColor',[48, 71, 94]/255,...
            'MarkerFaceColor',[48, 71, 94]/255,...
            'LineWidth',0.75);
scatter(X6,Y6,'MarkerEdgeColor',[48, 71, 94]/255,...  
              'LineWidth',0.75);        
plot(X5,Yhat5,'k','LineWidth',0.75);
plot(X6,Yhat6,'k','LineWidth',0.75);
hold off;
xlabel('Log del PIB en 1870','FontName','Serif','FontSize', 14)
ylabel('Diferencia logarítmica','FontName','Serif','FontSize', 14)
title('Muestra de Maddison','FontName','Serif','FontSize', 14)
legend('1870-1979','1870-1979: nuevos países','1870-2018','1870-2018: nuevos países')
saveas(gcf,'Maddison','epsc');
%% Developing vs developed economies
% IMF classification 
% (see: https://en.wikipedia.org/wiki/Developing_country)
% Source: WEO database, october 2018
Tstart=1870;
Tend=2018;

sample=[1     2     7    10    11    12    16    17    18    23    26   ...
    27    28    30    31    33    34    37    38    39    40    41  ...
    42    45    47    48    49    50    52    53    54    57    58  ...
    59    60    61    62    64    65    67]; % Developing economies

for i=1:length(sample)
% X axis: log(GDPpc)
X7(i,1)=log(BarroEq(sample(i),1));
% Y axis: log(GDPpc2018/GDPpc1870)
if Tend==1979
    j=2;
elseif Tend==2018
    j=3;
else
    disp('Elige entre 1979 y 2018 únicamente');
end
Y7(i,1)=log(BarroEq(sample(i),j)./BarroEq(sample(i),1));
end
[~,Yhat7]=ols(Y7,X7,1,0.05);

sample=[3     4     5     6     8     9    13    14    15    19    20   ...
    21    22    24    25    29    32    35    36    43    44    46  ...
    51    55    56    63    66]; % Advanced economies
for i=1:length(sample)
% X axis: log(GDPpc)
X8(i,1)=log(BarroEq(sample(i),1));
% Y axis: log(GDPpc2018/GDPpc1870)
if Tend==1979
    j=2;
elseif Tend==2018
    j=3;
else
    disp('Elige entre 1979 y 2018 únicamente');
end
Y8(i,1)=log(BarroEq(sample(i),j)./BarroEq(sample(i),1));
end
[~,Yhat8]=ols(Y8,X8,1,0.05);
%%%%%%%%%%
figure(4)
scatter(X7,Y7,'MarkerEdgeColor',[234, 84, 85]/255,...
            'MarkerFaceColor',[234, 84, 85]/255,...
            'LineWidth',0.75);
hold on;
scatter(X8,Y8,'MarkerEdgeColor',[48, 71, 94]/255,...
            'MarkerFaceColor',[48, 71, 94]/255,...
            'LineWidth',0.75);      
plot(X7,Yhat7,'k','LineWidth',0.75);
plot(X8,Yhat8,'k','LineWidth',0.75);
hold off;
xlabel('Log del PIB en 1870','FontName','Serif','FontSize', 14)
ylabel('Diferencia logarítmica','FontName','Serif','FontSize', 14)
title('Developing vs developed economies','FontName','Serif','FontSize', 14)
legend('Developing','Developed')
saveas(gcf,'EME_Others','epsc');