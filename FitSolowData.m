%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fitting the Solow model to the Data
% (c) Carlos Rojas Quiroz
% This version: 14.03.2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sources:
% I use a database comprises of up to three sources: (1) PWT 10.0, 
% (2) World Bank data on working-age people, and (3) the Barro and Lee 
% dataset on educational enrollment ratios. The sample span is 1960-2019.

% Abbreviations:
% NCEx: non-commodity exporter countries
% SCAP: countries with soundness statistical 
% capacity
% OECD: ~~

% Observations:
% NCEx: 72
% SCAP: 92
% OECD: 29
% All sample: 104

% External functions:
% In order to run this code, you require the function "ols":
% [Betahat, DeBeta, Pvalue, RsquareAdj] = ols(Y,X,D,Alpha)
% Inputs:
%       X = Vector with the endogenous variable
%       Y = Matrix with exogenous variables
%       D = Binary variable. If:
%           D = 1, then run the regression with a constant
%           D = 0, then run the regression without a constant
%       Alpha = statistical significance level
% Outputs:
%       Betahat = estimated parameters
%       DeBeta = standard deviation for each estimated parameter (not
%       robust)
%       Pvalue = ~~
%       RsquareAdj = adjusted R^2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc;
close all;
NCEx=xlsread('DataBaseGrowth.xlsx','NewSample','B3:F148');
NCEx(any(isnan(NCEx),2), :) = [];
SCAP=xlsread('DataBaseGrowth.xlsx','NewSample','G3:K148');
SCAP(any(isnan(SCAP),2), :) = [];
OECD=xlsread('DataBaseGrowth.xlsx','NewSample','L3:P148');
OECD(any(isnan(OECD),2), :) = [];
ALLS=xlsread('DataBaseGrowth.xlsx','NewSample','Q3:U148');
ALLS(any(isnan(ALLS),2), :) = [];
Data={NCEx,SCAP,OECD,ALLS};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sample index:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1: Non-commodity exporters (NCEx)
% 2: Statistical capacity (SCAP)
% 3: OECD
% 4: All sample
[~,NSample]=size(Data);
for i =1:NSample
    gdppc60_{i} = Data{1,i}(:,1);
    gdppc19_{i} = Data{1,i}(:,2);
    ndeltag_{i} = Data{1,i}(:,3);
    sharei_{i} = Data{1,i}(:,4);
    school_{i} = Data{1,i}(:,5);
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Model 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Y: log(GDPpc)
% X1: log(I/Y)
% X2: log(delta+g+n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i =1:NSample
X=[sharei_{1,i} ndeltag_{1,i}];
[Beta_{i}, De_{i}, Pvalue_{i}, RsquareAdj_{i}] = ols(gdppc19_{1,i},X,1,0.05);
end
for i =1:NSample
Tabla1(1,i)=Beta_{1,i}(3);
Tabla1(2,i)=De_{1,i}(3);
Tabla1(3,i)=Beta_{1,i}(1);
Tabla1(4,i)=De_{1,i}(1);
Tabla1(5,i)=Beta_{1,i}(2);
Tabla1(6,i)=De_{1,i}(2);
Tabla1(7,i)=RsquareAdj_{i};
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Model 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Y: log(GDPpc)
% X1: log(delta+g+n)
% X2: log(I/Y)
% X3: log(School)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i =1:NSample
X=[sharei_{1,i}-ndeltag_{1,i}];
[Beta_{i}, De_{i}, Pvalue_{i}, RsquareAdj_{i}] = ols(gdppc19_{1,i},X,1,0.05);
end
for i =1:NSample
Tabla2(1,i)=Beta_{1,i}(2);
Tabla2(2,i)=De_{1,i}(2);
Tabla2(3,i)=Beta_{1,i}(1);
Tabla2(4,i)=De_{1,i}(1);
Tabla2(5,i)=RsquareAdj_{i};
Tabla2(6,i)=Beta_{1,i}(1)/(1+Beta_{1,i}(1));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Model 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Y: log(GDPpc)
% X1: log(I/Y)
% X2: log(delta+g+n)
% X3: log(School)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i =1:NSample
X=[sharei_{1,i} ndeltag_{1,i} school_{1,i}];
[Beta_{i}, De_{i}, Pvalue_{i}, RsquareAdj_{i}] = ols(gdppc19_{1,i},X,1,0.05);
end
for i =1:NSample
Tabla3(1,i)=Beta_{1,i}(4);
Tabla3(2,i)=De_{1,i}(4);
Tabla3(3,i)=Beta_{1,i}(1);
Tabla3(4,i)=De_{1,i}(1);
Tabla3(5,i)=Beta_{1,i}(2);
Tabla3(6,i)=De_{1,i}(2);
Tabla3(7,i)=Beta_{1,i}(3);
Tabla3(8,i)=De_{1,i}(3);
Tabla3(9,i)=RsquareAdj_{i};
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Model 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Y: log(GDPpc)
% X1: log(I/Y)-log(delta+g+n)
% X2: log(School)-log(delta+g+n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i =1:NSample
X=[sharei_{1,i}-ndeltag_{1,i} school_{1,i}-ndeltag_{1,i}];
[Beta_{i}, De_{i}, Pvalue_{i}, RsquareAdj_{i}] = ols(gdppc19_{1,i},X,1,0.05);
end
for i =1:NSample
Tabla4(1,i)=Beta_{1,i}(3);
Tabla4(2,i)=De_{1,i}(3);    
Tabla4(3,i)=Beta_{1,i}(1);
Tabla4(4,i)=De_{1,i}(1);
Tabla4(5,i)=Beta_{1,i}(2);
Tabla4(6,i)=De_{1,i}(2);
Tabla4(7,i)=RsquareAdj_{i};
Tabla4(8,i)=Beta_{1,i}(1)/(1+Beta_{1,i}(1)+Beta_{1,i}(2));
Tabla4(9,i)=Beta_{1,i}(2)/(1+Beta_{1,i}(1)+Beta_{1,i}(2));
end
%% Convergence
% In this section we run some exercises to analyze the convergence
% hypothesis from the Solow model with our datasample. Notice we assess it
% using a sample from 1960 to 2019. 
GapYear=2019-1960;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Unconditional convergence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Model 5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Y: log(GDPpc2019) - log(GDPpc1960)
% X1: log(GDPpc1960)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i =1:NSample
X=[gdppc60_{1,i}];
[Beta_{i}, De_{i}, Pvalue_{i}, RsquareAdj_{i}] = ols(gdppc19_{1,i}-gdppc60_{1,i},X,1,0.05);
end
for i =1:NSample
Tabla5(1,i)=Beta_{1,i}(2);
Tabla5(2,i)=De_{1,i}(2);
Tabla5(3,i)=Beta_{1,i}(1);
Tabla5(4,i)=De_{1,i}(1);
Tabla5(5,i)=RsquareAdj_{i};
Tabla5(6,i)=-log(1+Beta_{1,i}(1))/GapYear;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Conditional convergence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Model 6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Y: log(GDPpc2019) - log(GDPpc1960)
% X1: log(GDPpc1960)
% X2: log(I/Y)
% X3: log(delta + g + n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i =1:NSample
X=[gdppc60_{1,i} sharei_{1,i} ndeltag_{1,i}];
[Beta_{i}, De_{i}, Pvalue_{i}, RsquareAdj_{i}] = ols(gdppc19_{1,i}-gdppc60_{1,i},X,1,0.05);
end
for i =1:NSample
Tabla6(1,i)=Beta_{1,i}(4);
Tabla6(2,i)=De_{1,i}(4);
Tabla6(3,i)=Beta_{1,i}(1);
Tabla6(4,i)=De_{1,i}(1);
Tabla6(5,i)=Beta_{1,i}(2);
Tabla6(6,i)=De_{1,i}(2);
Tabla6(7,i)=Beta_{1,i}(3);
Tabla6(8,i)=De_{1,i}(3);
Tabla6(9,i)=RsquareAdj_{i};
Tabla6(10,i)=-log(1+Beta_{1,i}(1))/GapYear;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Conditional convergence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Model 7
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Y: log(GDPpc2019) - log(GDPpc1960)
% X1: log(GDPpc1960)
% X2: log(I/Y)
% X3: log(delta + g + n)
% X4: log(School)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i =1:NSample
X=[gdppc60_{1,i} sharei_{1,i} ndeltag_{1,i} school_{1,i}];
[Beta_{i}, De_{i}, Pvalue_{i}, RsquareAdj_{i}] = ols(gdppc19_{1,i}-gdppc60_{1,i},X,1,0.05);
end
for i =1:NSample
Tabla7(1,i)=Beta_{1,i}(5);
Tabla7(2,i)=De_{1,i}(5);
Tabla7(3,i)=Beta_{1,i}(1);
Tabla7(4,i)=De_{1,i}(1);
Tabla7(5,i)=Beta_{1,i}(2);
Tabla7(6,i)=De_{1,i}(2);
Tabla7(7,i)=Beta_{1,i}(3);
Tabla7(8,i)=De_{1,i}(3);
Tabla7(9,i)=Beta_{1,i}(4);
Tabla7(10,i)=De_{1,i}(4);
Tabla7(11,i)=RsquareAdj_{i};
Tabla7(12,i)=-log(1+Beta_{1,i}(1))/GapYear;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Conditional convergence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Model 8
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Y: log(GDPpc2019) - log(GDPpc1960)
% X1: log(GDPpc1960)
% X2: log(I/Y)-log(delta + g + n) 
% X3: log(School)-log(delta + g + n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i =1:NSample
X=[gdppc60_{1,i} sharei_{1,i}-ndeltag_{1,i} school_{1,i}-ndeltag_{1,i}];
[Beta_{i}, De_{i}, Pvalue_{i}, RsquareAdj_{i}] = ols(gdppc19_{1,i}-gdppc60_{1,i},X,1,0.05);
end
for i =1:NSample
Tabla8(1,i)=Beta_{1,i}(4);
Tabla8(2,i)=De_{1,i}(4);
Tabla8(3,i)=Beta_{1,i}(1);
Tabla8(4,i)=De_{1,i}(1);
Tabla8(5,i)=Beta_{1,i}(2);
Tabla8(6,i)=De_{1,i}(2);
Tabla8(7,i)=Beta_{1,i}(3);
Tabla8(8,i)=De_{1,i}(3);
Tabla8(9,i)=RsquareAdj_{i};
Tabla8(10,i)=-log(1+Beta_{1,i}(1))/GapYear;
Aux1=Beta_{1,i}(2)/(1-exp(-Tabla8(10,i)*GapYear));
Aux2=Beta_{1,i}(3)/(1-exp(-Tabla8(10,i)*GapYear));
Tabla8(11,i)=Aux1/(1+Aux1+Aux2+1);
Tabla8(12,i)=Aux2/(1+Aux1+Aux2+1);
end