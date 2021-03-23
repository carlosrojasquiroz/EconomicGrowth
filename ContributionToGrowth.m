%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Contribution to growth - exercises for six countries
% (c) Carlos Rojas Quiroz
% This version: 14.03.2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sources: PWT 10.0, 
% Observations: 60 years for six countries
% Titles and axis labels are in Spanish. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc;
close all;
DataPeru=xlsread('ContributiontoGrowth14032021.xlsx','Peru','K14:N73');
DataChile=xlsread('ContributiontoGrowth14032021.xlsx','Chile','K14:N73');
DataColombia=xlsread('ContributiontoGrowth14032021.xlsx','Colombia','K14:N73');
DataAustralia=xlsread('ContributiontoGrowth14032021.xlsx','Australia','K14:N73');
DataNewZealand=xlsread('ContributiontoGrowth14032021.xlsx','NewZealand','K14:N73');
DataKorea=xlsread('ContributiontoGrowth14032021.xlsx','Korea','K14:N73');
[F,C]=size(DataPeru);
X=[1960:1:1960+F-1]';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Peru
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
StackedBars=DataPeru(:,[2:4]);
Contrib=bar(X,StackedBars,'stacked','FaceColor','flat','EdgeColor','none');
Contrib(3).CData = [48, 71, 94]/255; %Blue
Contrib(1).CData = [234, 84, 85]/255; %Warm
Contrib(2).CData = [147, 155, 98]/255; %Green
title('Contabilidad del crecimiento: Perú','FontName','Serif','FontSize', 14)
xlabel('Años','FontName','Serif','FontSize', 14);
ylabel('Crecimiento anual (%)','FontName','Serif','FontSize', 14);
legend('K','L','A','FontName','Serif','FontSize', 14,'Location','southoutside','Orientation','horizontal')
saveas(gcf,'ContributionPeru','epsc');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% New Zealand
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
StackedBars=DataNewZealand(:,[2:4]);
Contrib=bar(X,StackedBars,'stacked','FaceColor','flat','EdgeColor','none');
Contrib(3).CData = [48, 71, 94]/255; %Blue
Contrib(1).CData = [234, 84, 85]/255; %Warm
Contrib(2).CData = [147, 155, 98]/255; %Green
title('Contabilidad del crecimiento: Nueva Zelanda','FontName','Serif','FontSize', 14)
xlabel('Años','FontName','Serif','FontSize', 14);
ylabel('Crecimiento anual (%)','FontName','Serif','FontSize', 14);
legend('K','L','A','FontName','Serif','FontSize', 14,'Location','southoutside','Orientation','horizontal')
saveas(gcf,'ContributionNewZealand','epsc');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Australia
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3)
StackedBars=DataAustralia(:,[2:4]);
Contrib=bar(X,StackedBars,'stacked','FaceColor','flat','EdgeColor','none');
Contrib(3).CData = [48, 71, 94]/255; %Blue
Contrib(1).CData = [234, 84, 85]/255; %Warm
Contrib(2).CData = [147, 155, 98]/255; %Green
title('Contabilidad del crecimiento: Australia','FontName','Serif','FontSize', 14)
xlabel('Años','FontName','Serif','FontSize', 14);
ylabel('Crecimiento anual (%)','FontName','Serif','FontSize', 14);
legend('K','L','A','FontName','Serif','FontSize', 14,'Location','southoutside','Orientation','horizontal')
saveas(gcf,'ContributionAustralia','epsc');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% South Korea
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4)
StackedBars=DataKorea(:,[2:4]);
Contrib=bar(X,StackedBars,'stacked','FaceColor','flat','EdgeColor','none');
Contrib(3).CData = [48, 71, 94]/255; %Blue
Contrib(1).CData = [234, 84, 85]/255; %Warm
Contrib(2).CData = [147, 155, 98]/255; %Green
title('Contabilidad del crecimiento: Corea','FontName','Serif','FontSize', 14)
xlabel('Años','FontName','Serif','FontSize', 14);
ylabel('Crecimiento anual (%)','FontName','Serif','FontSize', 14);
legend('K','L','A','FontName','Serif','FontSize', 14,'Location','southoutside','Orientation','horizontal')
saveas(gcf,'ContributionCorea','epsc');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Chile
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(5)
StackedBars=DataChile(:,[2:4]);
Contrib=bar(X,StackedBars,'stacked','FaceColor','flat','EdgeColor','none');
Contrib(3).CData = [48, 71, 94]/255; %Blue
Contrib(1).CData = [234, 84, 85]/255; %Warm
Contrib(2).CData = [147, 155, 98]/255; %Green
title('Contabilidad del crecimiento: Chile','FontName','Serif','FontSize', 14)
xlabel('Años','FontName','Serif','FontSize', 14);
ylabel('Crecimiento anual (%)','FontName','Serif','FontSize', 14);
legend('K','L','A','FontName','Serif','FontSize', 14,'Location','southoutside','Orientation','horizontal')
saveas(gcf,'ContributionChile','epsc');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Colombia
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(6)
StackedBars=DataColombia(:,[2:4]);
Contrib=bar(X,StackedBars,'stacked','FaceColor','flat','EdgeColor','none');
Contrib(3).CData = [48, 71, 94]/255; %Blue
Contrib(1).CData = [234, 84, 85]/255; %Warm
Contrib(2).CData = [147, 155, 98]/255; %Green
title('Contabilidad del crecimiento: Colombia','FontName','Serif','FontSize', 14)
xlabel('Años','FontName','Serif','FontSize', 14);
ylabel('Crecimiento anual (%)','FontName','Serif','FontSize', 14);
legend('K','L','A','FontName','Serif','FontSize', 14,'Location','southoutside','Orientation','horizontal')
saveas(gcf,'ContributionColombia','epsc');
