%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figures - economic growth - stylized facts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (C) Carlos Rojas Quiroz
% This version: 14.03.2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Source: PWT10.0, MPD2020, Barro-Lee dataset
% External functions:
%   In order to run this code, you require the function "ols2":
%   [Betahat, Yhat] = ols(Y,X,D,Alpha)
% Titles and axis labels are in Spanish. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Distribucion PIB per capita
GDP_pc = xlsread('PWT14032021.xlsx','Graphs','B9:E191');
pts=[0:100:80000];
Dist1960=GDP_pc(:,1);
Dist1960(any(isnan(Dist1960),2), :) = [];
[F60,X60]=ksdensity(Dist1960,pts);
Dist1980=GDP_pc(:,2);
Dist1980(any(isnan(Dist1980),2), :) = [];
[F80,X80]=ksdensity(Dist1980,pts);
Dist2000=GDP_pc(:,3);
Dist2000(any(isnan(Dist2000),2), :) = [];
Dist2000=Dist2000(any(Dist2000,2),:);
[F00,X00]=ksdensity(Dist2000,pts);
Dist2019=GDP_pc(:,4);
Dist2019(any(isnan(Dist2019),2), :) = [];
[F19,X19]=ksdensity(Dist2019,pts);
%%%%%%%%%
figure(1)
plot(X60,F60,'Color',[48, 71, 94]/255,'LineWidth',2.15);
hold on
plot(X80,F80,'Color',[234, 84, 85]/255,'LineWidth',2.15);
plot(X00,F00,'Color',[147, 155, 98]/255,'LineWidth',2.15);
plot(X19,F19,'Color',[240, 123, 63]/255,'LineWidth',2.15);
xticks([0 20000 40000 60000 80000])
xticklabels({'0','20000','40000','60000','80000'})
yticks([])
title('Dist. del $PIB_{pc}$','FontName','Serif','FontSize', 12,'interpreter','latex')
xlabel('US$ 2017','FontName','Serif','FontSize', 12);
ylabel('Densidad','FontName','Serif','FontSize', 12);
legend('1960','1980','2000','2019','FontName','Serif','FontSize', 10,'Location','Northeast','Orientation','vertical')
saveas(gcf,'DensityGDPpc','epsc');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Distribucion Log PIB per capita
pts=[5:0.05:13];
Dist1960=log(Dist1960);
[F60,X60]=ksdensity(Dist1960,pts);
Dist1980=log(Dist1980);
[F80,X80]=ksdensity(Dist1980,pts);
Dist2000=log(Dist2000);
[F00,X00]=ksdensity(Dist2000,pts);
Dist2019=log(Dist2019);
[F19,X19]=ksdensity(Dist2019,pts);
%%%%%%%%%
figure(2)
plot(X60,F60,'Color',[48, 71, 94]/255,'LineWidth',2.15);
hold on
plot(X80,F80,'Color',[234, 84, 85]/255,'LineWidth',2.15);
plot(X00,F00,'Color',[147, 155, 98]/255,'LineWidth',2.15);
plot(X19,F19,'Color',[240, 123, 63]/255,'LineWidth',2.15);
xticks([6 8 10 12])
xticklabels({'6','8','10','12'})
yticks([])
title('Dist. del $\log(PIB_{pc})$','FontName','Serif','FontSize', 12,'interpreter','latex')
xlabel('$\log(PIB_{pc})$','FontName','Serif','FontSize', 12,'interpreter','latex');
ylabel('Densidad','FontName','Serif','FontSize', 12);
legend('1960','1980','2000','2019','FontName','Serif','FontSize', 10,'Location','Northeast','Orientation','vertical')
saveas(gcf,'DensitylogGDPpc','epsc');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Distribucion Log PIB per worker
clear all; 
clc;
GDP_pc = xlsread('PWT14032021.xlsx','Graphs','F9:I191');
pts=[5:0.05:14];
Dist1960=GDP_pc(:,1);
Dist1960(any(isnan(Dist1960),2), :) = [];
Dist1960=log(Dist1960);
[F60,X60]=ksdensity(Dist1960,pts);
CV60=std(Dist1960)/mean(Dist1960);
Dist1980=GDP_pc(:,2);
Dist1980(any(isnan(Dist1980),2), :) = [];
Dist1980=log(Dist1980);
[F80,X80]=ksdensity(Dist1980,pts);
CV80=std(Dist1980)/mean(Dist1980);
Dist2000=GDP_pc(:,3);
Dist2000(any(isnan(Dist2000),2), :) = [];
Dist2000=Dist2000(any(Dist2000,2),:);
Dist2000=log(Dist2000);
[F00,X00]=ksdensity(Dist2000,pts);
CV00=std(Dist2000)/mean(Dist2000);
Dist2019=GDP_pc(:,4);
Dist2019(any(isnan(Dist2019),2), :) = [];
Dist2019=log(Dist2019);
[F19,X19]=ksdensity(Dist2019,pts);
CV19=std(Dist2019)/mean(Dist2019);
%%%%%%%%%
figure(3)
plot(X60,F60,'Color',[48, 71, 94]/255,'LineWidth',2.15);
hold on
plot(X80,F80,'Color',[234, 84, 85]/255,'LineWidth',2.15);
plot(X00,F00,'Color',[147, 155, 98]/255,'LineWidth',2.15);
plot(X19,F19,'Color',[240, 123, 63]/255,'LineWidth',2.15);
xticks([6 8 10 12 14])
xticklabels({'6','8','10','12','14'})
yticks([])
title('Dist. del $\log(PIB_{pw})$','FontName','Serif','FontSize', 12,'interpreter','latex')
xlabel('$\log(PIB_{pw})$','FontName','Serif','FontSize', 12,'interpreter','latex');
ylabel('Densidad','FontName','Serif','FontSize', 12);
legend('1960','1980','2000','2019','FontName','Serif','FontSize', 10,'Location','Northeast','Orientation','vertical')
saveas(gcf,'DensityGDPpw','epsc');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ingreso y bienestar
clear all;
clc;
IW_pc = xlsread('PWT14032021.xlsx','Graphs','J9:K191');
GDP=IW_pc(:,1);
Consump=IW_pc(:,2);
[~,Yhat]=ols2(Consump,GDP,1,0.05);
%%%%%%%%%
figure(4)
scatter(GDP,Consump,'MarkerEdgeColor',[234, 84, 85]/255,...
            'MarkerFaceColor',[234, 84, 85]/255,...
            'LineWidth',0.75);
hold on;
plot(GDP,Yhat,'k','LineWidth',0.75);
hold off;
xlabel('$\log(PIB_{pc})$, 2019','FontName','Serif','FontSize', 12,'interpreter','latex')
ylabel('$\log(Consumo_{pc})$, 2019','FontName','Serif','FontSize', 12,'interpreter','latex')
title('Ingreso y bienestar','FontName','Serif','FontSize', 12)
saveas(gcf,'I_W','epsc');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Distribucion del crecimiento del PIB por trabajador
clear all;
clc;
Growth_pc = xlsread('PWT14032021.xlsx','Graphs','T9:W191');
Growth60=Growth_pc(:,1);
Growth60(any(isnan(Growth60),2), :) = [];
Growth80=Growth_pc(:,2);
Growth80(any(isnan(Growth80),2), :) = [];
Growth00=Growth_pc(:,3);
Growth00(any(isnan(Growth00),2), :) = [];
Growth19=Growth_pc(:,4);
Growth19(any(isnan(Growth19),2), :) = [];
pts=[-0.15:0.001:0.2];
[F60,X60]=ksdensity(Growth60,pts);
[F80,X80]=ksdensity(Growth80,pts);
[F00,X00]=ksdensity(Growth00,pts);
[F19,X19]=ksdensity(Growth19,pts);
%%%%%%%%%
figure(5)
plot(X60,F60,'Color',[48, 71, 94]/255,'LineWidth',2.15);
hold on
plot(X80,F80,'Color',[234, 84, 85]/255,'LineWidth',2.15);
plot(X00,F00,'Color',[147, 155, 98]/255,'LineWidth',2.15);
plot(X19,F19,'Color',[240, 123, 63]/255,'LineWidth',2.15);
xticks([-0.1 0 0.1 0.2])
xticklabels({'-0.1','0','0.1','0.2'})
yticks([])
title('Dist. del $\Delta \log(PIB_{pw})$','FontName','Serif','FontSize', 14,'interpreter','latex')
xlabel('$\Delta \log(PIB_{pw})$','FontName','Serif','FontSize', 12,'interpreter','latex');
ylabel('Densidad','FontName','Serif','FontSize', 12);
legend('1960','1980','2000','2019','FontName','Serif','FontSize', 10,'Location','Northeast','Orientation','vertical')
saveas(gcf,'DensityGDPpwgrowth','epsc');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Diferencias de ingresos
clear all;
clc;
GDP_pw = xlsread('PWT14032021.xlsx','Graphs','X9:AA191');
GDP_pw(any(isnan(GDP_pw),2), :) = [];
GDP_pw60=GDP_pw(:,1);
GDP_pw80=GDP_pw(:,2);
GDP_pw00=GDP_pw(:,3);
GDP_pw19=GDP_pw(:,4);
trend=linspace(-4,0.5,91);
%%%%%%%%%
[~,Yhat]=ols2(GDP_pw19,GDP_pw60,1,0.05);
%%%%%%%%%
figure(6)
SS=scatter(GDP_pw60,GDP_pw19,'MarkerEdgeColor',[234, 84, 85]/255,...
            'MarkerFaceColor',[234, 84, 85]/255,...
            'LineWidth',0.75);
hold on;
plot(GDP_pw60,Yhat,'k','LineWidth',0.75);
plot(trend,trend,'Color',[255, 212, 96]/255,'LineWidth',0.75);
hold off;
xlabel('$\log\left(\frac{PIB_{pw}}{PIB^{USA}_{pw}}\right)$, 1960','FontName','Serif','FontSize', 12,'interpreter','latex')
ylabel('$\log\left(\frac{PIB_{pw}}{PIB^{USA}_{pw}}\right)$, 2019','FontName','Serif','FontSize', 12,'interpreter','latex')
title('Diferencias de ingresos','FontName','Serif','FontSize', 12)
set(get(get(SS,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
legend('OLS','45º','FontName','Serif','FontSize', 10,'Location','Southeast','Orientation','vertical')
saveas(gcf,'RelativeUSA19','epsc');
%%%%%%%%%
[~,Yhat]=ols2(GDP_pw00,GDP_pw60,1,0.05);
%%%%%%%%%
figure(7)
SS=scatter(GDP_pw60,GDP_pw00,'MarkerEdgeColor',[234, 84, 85]/255,...
            'MarkerFaceColor',[234, 84, 85]/255,...
            'LineWidth',0.75);
hold on;
plot(GDP_pw60,Yhat,'k','LineWidth',0.75);
plot(trend,trend,'Color',[255, 212, 96]/255,'LineWidth',0.75);
hold off;
xlabel('$\log\left(\frac{PIB_{pw}}{PIB^{USA}_{pw}}\right)$, 1960','FontName','Serif','FontSize', 12,'interpreter','latex')
ylabel('$\log\left(\frac{PIB_{pw}}{PIB^{USA}_{pw}}\right)$, 2000','FontName','Serif','FontSize', 12,'interpreter','latex')
title('Diferencias de ingresos','FontName','Serif','FontSize', 12)
set(get(get(SS,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
legend('OLS','45º','FontName','Serif','FontSize', 10,'Location','Southeast','Orientation','vertical')
saveas(gcf,'RelativeUSA00','epsc');
%%%%%%%%%
[~,Yhat]=ols2(GDP_pw80,GDP_pw60,1,0.05);
%%%%%%%%%
figure(8)
SS=scatter(GDP_pw60,GDP_pw80,'MarkerEdgeColor',[234, 84, 85]/255,...
            'MarkerFaceColor',[234, 84, 85]/255,...
            'LineWidth',0.75);
hold on;
plot(GDP_pw60,Yhat,'k','LineWidth',0.75);
plot(trend,trend,'Color',[255, 212, 96]/255,'LineWidth',0.75);
hold off;
xlabel('$\log\left(\frac{PIB_{pw}}{PIB^{USA}_{pw}}\right)$, 1960','FontName','Serif','FontSize', 12,'interpreter','latex')
ylabel('$\log\left(\frac{PIB_{pw}}{PIB^{USA}_{pw}}\right)$, 1980','FontName','Serif','FontSize', 12,'interpreter','latex')
title('Diferencias de ingresos','FontName','Serif','FontSize', 12)
set(get(get(SS,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
legend('OLS','45º','FontName','Serif','FontSize', 10,'Location','Southeast','Orientation','vertical')
saveas(gcf,'RelativeUSA80','epsc');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Distribucion Log GDP per capita ponderado por poblacion
clear all;
clc;
GDP_pcN = xlsread('PWT14032021.xlsx','Graphs','AF9:AI191');
pts=[-5:0.01:8];
Dist1960=GDP_pcN(:,1);
Dist1960(any(isnan(Dist1960),2), :) = [];
[F60,X60]=ksdensity(Dist1960,pts);
Dist1980=GDP_pcN(:,2);
Dist1980(any(isnan(Dist1980),2), :) = [];
[F80,X80]=ksdensity(Dist1980,pts);
Dist2000=GDP_pcN(:,3);
Dist2000(any(isnan(Dist2000),2), :) = [];
[F00,X00]=ksdensity(Dist2000,pts);
Dist2019=GDP_pcN(:,4);
Dist2019(any(isnan(Dist2019),2), :) = [];
[F19,X19]=ksdensity(Dist2019,pts);
%%%%%%%%%
figure(9)
plot(X60,F60,'Color',[48, 71, 94]/255,'LineWidth',2.15);
hold on
plot(X80,F80,'Color',[234, 84, 85]/255,'LineWidth',2.15);
plot(X00,F00,'Color',[147, 155, 98]/255,'LineWidth',2.15);
plot(X19,F19,'Color',[240, 123, 63]/255,'LineWidth',2.15);
xticks([-4:2:8])
xticklabels({'-4','-2','0','2','4','6','8'})
yticks([])
title('Dist. del $\log(PIB_{pc})$ ponderado','FontName','Serif','FontSize', 12,'interpreter','latex')
xlabel('$\log(PIB_{pc})$ ponderado','FontName','Serif','FontSize', 12,'interpreter','latex');
ylabel('Densidad','FontName','Serif','FontSize', 12);
legend('1960','1980','2000','2019','FontName','Serif','FontSize', 10,'Location','Northeast','Orientation','vertical')
saveas(gcf,'DensitylogGDPpcN','epsc');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Factores correlacionados
clear all;
clc;
Base = xlsread('PWT14032021.xlsx','Graphs','AJ9:AP191');
IY19=Base(:,[2,6]);
IY19(any(isnan(IY19),2), :) = [];
HC19=Base(:,[4,6]);
HC19(any(isnan(HC19),2), :) = [];
SY=[Base(:,[6,7])];
SY(any(isnan(SY),2), :) = [];
%%%%%%%%%
[~,Yhat]=ols2(IY19(:,2),IY19(:,1),1,0.05);
%%%%%%%%%
figure(10)
SS=scatter(IY19(:,1),IY19(:,2),'MarkerEdgeColor',[234, 84, 85]/255,...
            'MarkerFaceColor',[234, 84, 85]/255,...
            'LineWidth',0.75);
hold on;
plot(IY19(:,1),Yhat,'k','LineWidth',0.75);
hold off;
xlabel('$\left(\frac{I}{Y}\right)$, promedio 1960-2019','FontName','Serif','FontSize', 12,'interpreter','latex')
ylabel('$\Delta PIB_{pc}$, promedio 1960-2019','FontName','Serif','FontSize', 12,'interpreter','latex')
title('Factores correlacionados, inversion','FontName','Serif','FontSize', 12)
saveas(gcf,'IY_Growth','epsc');
%%%%%%%%%
[~,Yhat]=ols2(HC19(:,2),HC19(:,1),1,0.05);
%%%%%%%%%
figure(11)
SS=scatter(HC19(:,1),HC19(:,2),'MarkerEdgeColor',[234, 84, 85]/255,...
            'MarkerFaceColor',[234, 84, 85]/255,...
            'LineWidth',0.75);
hold on;
plot(HC19(:,1),Yhat,'k','LineWidth',0.75);
hold off;
xlabel('$HC$, promedio 1960-2019','FontName','Serif','FontSize', 12,'interpreter','latex')
ylabel('$\Delta PIB_{pc}$, promedio 1960-2019','FontName','Serif','FontSize', 12,'interpreter','latex')
title('Factores correlacionados, capital humano','FontName','Serif','FontSize', 12)
saveas(gcf,'HC_Growth','epsc');
%%%%%%%%%
[~,Yhat]=ols2(SY(:,1),SY(:,2),1,0.05);
%%%%%%%%%
figure(12)
SS=scatter(SY(:,2),SY(:,1),'MarkerEdgeColor',[234, 84, 85]/255,...
            'MarkerFaceColor',[234, 84, 85]/255,...
            'LineWidth',0.75);
hold on;
plot(SY(:,2),Yhat,'k','LineWidth',0.75);
hold off;
xlabel('$School$, promedio 1960-2019','FontName','Serif','FontSize', 12,'interpreter','latex')
ylabel('$\Delta PIB_{pc}$, promedio 1960-2019','FontName','Serif','FontSize', 12,'interpreter','latex')
title('Factores correlacionados, capital humano','FontName','Serif','FontSize', 12)
saveas(gcf,'School_Growth','epsc');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Evolución del PIB per cápita según el PWT 10.0
clear all;
clc;
Countries={'United States'	'United Kingdom'	'Spain'	'Singapore'	'Brazil'	'South Korea'	'Guatemala'	'Botswana'	'Nigeria'	'India'	'Peru'	'Chile'	'Australia'};
Identifiers={'USA','UK','ESP','SGP','BRA','KOR','GTM','BWA','NGA','IND','PER','CHI','AUS'};
GDP_pc = xlsread('PWT14032021.xlsx','EvolutionPWT','B6:N65');
[T,N]=size(GDP_pc);
sample=[1960:1:1960+T-1];
%%%%%%%%%
figure(13)
plot(sample,GDP_pc(:,1),'Color',[48, 71, 94]/255,'LineWidth',2.15)
hold on;
plot(sample,GDP_pc(:,2),'Color',[234, 84, 85]/255,'LineWidth',2.15)
plot(sample,GDP_pc(:,3),'Color',[147, 155, 98]/255,'LineWidth',2.15)
plot(sample,GDP_pc(:,4),'Color',[240, 123, 63]/255,'LineWidth',2.15)
plot(sample,GDP_pc(:,5),'Color',[255, 212, 96]/255,'LineWidth',2.15)
plot(sample,GDP_pc(:,6),'-.','Color',[48, 71, 94]/255,'LineWidth',2.15)
plot(sample,GDP_pc(:,7),'-.','Color',[234, 84, 85]/255,'LineWidth',2.15)
plot(sample,GDP_pc(:,8),'-.','Color',[147, 155, 98]/255,'LineWidth',2.15)
plot(sample,GDP_pc(:,9),'-.','Color',[240, 123, 63]/255,'LineWidth',2.15)
plot(sample,GDP_pc(:,10),'-.','Color',[255, 212, 96]/255,'LineWidth',2.15)
title('Evolución del PIB pc','FontName','Serif','FontSize', 14)
xlabel('Años','FontName','Serif','FontSize', 14);
ylabel('Log PIB pc','FontName','Serif','FontSize', 14);
legend(Identifiers(1,[1:10]),'FontName','Serif','FontSize', 10,'Location','southoutside','Orientation','horizontal','NumColumns',5)
saveas(gcf,'Evolution_PWT','epsc');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Evolución del PIB per cápita según el MPD 2020
clear all;
clc;
Countries={'United States'	'United Kingdom'	'Spain'	'Singapore'	'Brazil'	'South Korea'	'Guatemala'	'Botswana'	'Nigeria'	'India'	'Ghana' 'China' 'Peru'	'Chile'	'Australia'};
Identifiers={'USA','UK','ESP','SGP','BRA','KOR','GTM','BWA','NGA','IND','GHA','CHN','PER','CHI','AUS'};
GDP_pc = xlsread('PWT14032021.xlsx','EvolutionMPD','B6:M204');
[T,N]=size(GDP_pc);
years=[1820:1:1820+T-1];
Start=1960;
T0=find(years==Start);
sample=[T0:1:T];
%%%%%%%%%
figure(14)
plot(years(sample),GDP_pc(sample,1),'Color',[48, 71, 94]/255,'LineWidth',2.15)
hold on;
plot(years(sample),GDP_pc(sample,2),'Color',[234, 84, 85]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,3),'Color',[147, 155, 98]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,4),'Color',[240, 123, 63]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,5),'Color',[255, 212, 96]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,6),'-.','Color',[48, 71, 94]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,7),'-.','Color',[234, 84, 85]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,8),'-.','Color',[147, 155, 98]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,9),'-.','Color',[240, 123, 63]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,10),'-.','Color',[255, 212, 96]/255,'LineWidth',2.15)
title('Evolución del PIB pc','FontName','Serif','FontSize', 14)
xlabel('Años','FontName','Serif','FontSize', 14);
ylabel('Log PIB pc','FontName','Serif','FontSize', 14);
legend(Identifiers(1,[1:10]),'FontName','Serif','FontSize', 10,'Location','southoutside','Orientation','horizontal','NumColumns',5)
saveas(gcf,'Evolution_MPD_1960','epsc');
Start=1820;
T0=find(years==Start);
sample=[T0:1:T];
GDP_pc=GDP_pc(:,[1 2 3 5 10 11 12]);
%%%%%%%%%
figure(15)
plot(years(sample),GDP_pc(sample,1),'Color',[48, 71, 94]/255,'LineWidth',2.15)
hold on;
plot(years(sample),GDP_pc(sample,2),'Color',[234, 84, 85]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,3),'Color',[147, 155, 98]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,4),'Color',[240, 123, 63]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,5),'Color',[255, 212, 96]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,6),'-.','Color',[48, 71, 94]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,7),'-.','Color',[234, 84, 85]/255,'LineWidth',2.15)
title('Evolución del PIB pc','FontName','Serif','FontSize', 14)
xlabel('Años','FontName','Serif','FontSize', 14);
ylabel('Log PIB pc','FontName','Serif','FontSize', 14);
legend(Identifiers(1,[1 2 3 5 10 11 12]),'FontName','Serif','FontSize', 10,'Location','southoutside','Orientation','horizontal')
saveas(gcf,'Evolution_MPD_1820','epsc');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Evolución del PIB per cápita según el MPD 2020 - Peru, Chile, Colombia, Australia, Nueva Zelanda y Corea del Sur
clear all;
clc;
Countries={'Peru','Chile','Colombia','Australia','New Zealand','Korea'};
Identifiers={'PER','CHI','COL','AUS','NZL','KOR'};
GDP_pc = xlsread('PWT14032021.xlsx','EvolutionMPD','N6:S204');
[T,N]=size(GDP_pc);
years=[1820:1:1820+T-1];
Start=1960;
T0=find(years==Start);
sample=[T0:1:T];
%%%%%%%%%
figure(16)
plot(years(sample),GDP_pc(sample,1),'Color',[48, 71, 94]/255,'LineWidth',2.15)
hold on;
plot(years(sample),GDP_pc(sample,2),'Color',[234, 84, 85]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,3),'Color',[147, 155, 98]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,4),'Color',[240, 123, 63]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,5),'Color',[255, 212, 96]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,6),'-.','Color',[48, 71, 94]/255,'LineWidth',2.15)
title('Evolución del PIB pc','FontName','Serif','FontSize', 14)
xlabel('Años','FontName','Serif','FontSize', 14);
ylabel('Log PIB pc','FontName','Serif','FontSize', 14);
legend(Identifiers,'FontName','Serif','FontSize', 10,'Location','southoutside','Orientation','horizontal')
saveas(gcf,'Evolution_PCA_1960','epsc');
Start=1820;
T0=find(years==Start);
sample=[T0:1:T];
%%%%%%%%%
figure(17)
plot(years(sample),GDP_pc(sample,1),'Color',[48, 71, 94]/255,'LineWidth',2.15)
hold on;
plot(years(sample),GDP_pc(sample,2),'Color',[234, 84, 85]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,3),'Color',[147, 155, 98]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,4),'Color',[240, 123, 63]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,5),'Color',[255, 212, 96]/255,'LineWidth',2.15)
plot(years(sample),GDP_pc(sample,6),'-.','Color',[48, 71, 94]/255,'LineWidth',2.15)
title('Evolución del PIB pc','FontName','Serif','FontSize', 14)
xlabel('Años','FontName','Serif','FontSize', 14);
ylabel('Log PIB pc','FontName','Serif','FontSize', 14);
legend(Identifiers,'FontName','Serif','FontSize', 10,'Location','southoutside','Orientation','horizontal')
saveas(gcf,'Evolution_PCA_1820','epsc');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Términos de intercambio y TFP
clear all;
clc;
Base = xlsread('PWT14032021.xlsx','TFP_TOT','B2:E61');
%%%%%%%%%
[~,Yhat]=ols2(Base(:,1),Base(:,3),1,0.05);
%%%%%%%%%
figure(18)
SS=scatter(Base(:,5),Base(:,1),'MarkerEdgeColor',[234, 84, 85]/255,...
            'MarkerFaceColor',[234, 84, 85]/255,...
            'LineWidth',0.75);
hold on;
plot(Base(:,5),Yhat,'k','LineWidth',0.75);
hold off;
xlabel('Terminos de intercambio, 1960-2019','FontName','Serif','FontSize', 12,'interpreter','latex')
ylabel('PTF, 1960-2019','FontName','Serif','FontSize', 12,'interpreter','latex')
title('PTF y factores externos','FontName','Serif','FontSize', 12)
saveas(gcf,'PTF_TOT1','epsc');
%%%%%%%%%
[~,Yhat]=ols2(Base(:,2),Base(:,4),1,0.05);
%%%%%%%%%
figure(19)
SS=scatter(Base(:,6),Base(:,2),'MarkerEdgeColor',[234, 84, 85]/255,...
            'MarkerFaceColor',[234, 84, 85]/255,...
            'LineWidth',0.75);
hold on;
plot(Base(:,6),Yhat,'k','LineWidth',0.75);
hold off;
xlabel('$\Delta$ Terminos de intercambio, 1960-2019','FontName','Serif','FontSize', 12,'interpreter','latex')
ylabel('$\Delta$ PTF, 1960-2019','FontName','Serif','FontSize', 12,'interpreter','latex')
title('PTF y factores externos','FontName','Serif','FontSize', 12)
saveas(gcf,'PTF_TOT2','epsc');
