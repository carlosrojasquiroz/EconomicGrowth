function [Betahat, Yhat] = ols2(Y,X,D,Alpha)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Running a simple ordinary least squares estimation. 
% You will obtain an Eviews-style table with your results 
% (c) Carlos Rojas Quiroz
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [Betahat, Yhat] = ols(Y,X,D,Alpha)
% Inputs:
%       X = Vector with the endogenous variable
%       Y = Matrix with exogenous variables
%       D = Binary variable. If D = 1, run the regression with a constant
%       Alpha = statistical significance level
% Outputs:
%       Betahat = Regression coefficients
%       Yhat = Fitted Y variable
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if D==1
        C=ones(length(Y(:,1)),1);
        X=[X C];
    else
        X=X;
    end
    Betahat=inv(X'*X)*(X'*Y);
    n=length(Y(:,1));
    Yhat=X*Betahat;
    u=Y-Yhat;
    k=numel(Betahat);
    Var=u'*u/(n-k); % Varianza del error de estimacion
    Ybar=mean(Y);
    Rsquare=1-u'*u/((Y-repmat(Ybar,n,1))'* ... % R cuadrado
    (Y-repmat(Ybar,n,1)));
    RsquareAdj=1-(u'*u/(n-k))/((Y-repmat(Ybar,n,1))'* ...  % R cuadrado ajustado
    (Y-repmat(Ybar,n,1))/(n-1));
    VarBeta=Var*(inv(X'*X));
    DeBeta=diag(VarBeta).^.5; % Desviacion estandar de Beta
    Tstat=Betahat./DeBeta; % Estadistico t-student
    Pvalue = (1-tcdf(abs(Tstat),n-k))*2; % P-value
    LimInf=[Betahat-tinv(1-Alpha/2,n-k)*DeBeta]; % L?mite inferior del Intervalo de Confianza
    LimSup=[Betahat+tinv(1-Alpha/2,n-k)*DeBeta]; % Limite superior del Intervalo de Confianza
    Resultados=[Betahat DeBeta Tstat Pvalue LimInf LimSup];
    for jj=1:(length(X(1,:))-1)
        BetaLabel{jj}=['Beta' '_' num2str(jj)];
    end
        BetaLabel{length(X(1,:))}='Constant';        
    Tabla1=table(Resultados(:,1),Resultados(:,2),Resultados(:,3),Resultados(:,4),Resultados(:,5),Resultados(:,6));
    Tabla1.Properties.VariableNames = {'Coef','StdErr','t','Pvalue','ICInf','ICSup'};
    Tabla1.Properties.RowNames = BetaLabel';
    R2=[Rsquare RsquareAdj];
    Tabla2=table(R2(:,1),R2(:,2));
    Tabla2.Properties.VariableNames = {'RSquare','RSquareAdj'};
    disp(Tabla1)
    disp(Tabla2)
end
