close all 
clear 
clc 
 
%% Manipulations 1,2
 
%_______________Paramètres
    N = 1000; 
    u=2 ; sigma =3; 
    Realisations = u + sigma * randn(N,1);      
    y = -15:0.1:15; 
    f = exp(-(y-u).^2./(2*sigma^2))./(sigma*sqrt(2*pi));
    
%_______________Figures
figure, hist = histogram(Realisations, 'Normalization','pdf'); 
hold on 
plot(y, f, 'Linewidth', 1.5); xlabel('X'), ylabel('P(X=x)'); 
title("Histogramme et fonction densité d'une variable aléatoire gaussienne");
legend('Histogramme', 'Densité');
H= calcul_entropie(hist); 
    
%% Manipulations 3,4,5
 
%_______________Paramètres
 
  	X = randn(2,N); 
A = [2 1; 1 2]; [U,D] = eig(A); B = U*D.^(0.5)*U';
 	 mu = [0.2 0.2]'; 
  	Y = B*X + mu; 
  	m_1 = mean(Y(1,:));m_2 = mean(Y(2,:)); covv = cov(Y(1,:),Y(2,:)); %Vérification
  	XT = X.'; YT = Y.'; 
  	corrcoefXY = corrcoef(YT(:,1),XT(:,1)); 
 
%_____________Figures
figure,  h = histogram2(Y(1,:),Y(2,:),'Normalization','pdf');
h.FaceColor = 'flat';
xlabel('Y_1'), ylabel('Y_2'); 
zlabel('Probabilité') ;
title("Histogramme bivariée de Y");
figure, 
 h1 = histogram2(X(1,:), X(2,:),'Normalization','pdf'); 
xlabel('X_1'), ylabel('X_2'); 
zlabel('Probabilité') ;
title("Histogramme bivariée de X");
h1.FaceColor = 'flat';
 
%% Manipulation 6,7,8 
 
%______________Paramètres
    load X_pluv.mat
    X1 = X_pluv(:,1);   %   Bordeaux
    X2 = X_pluv(:,2);   %   Nantes
    X3 = X_pluv(:,3);   %   Santiago 
    
    Y1 = [X1, X2]; Y2 = [X1, X3]; Y3 = [X2, X3]; 
    cov1 = cov(Y1); cov2 = cov(Y2); cov3 = cov(Y3);
    
%% Functions 
%_______________Entropie
 
function H=calcul_entropie(hist) 
      H = 0; 
      number_bins = hist.NumBins; 
      values = hist.Values; 
      width = hist.BinWidth; 
      for i=1:number_bins
        if(values(i) ~= 0)
          H = H - values(i)*width*log(values(i));
        end
      end 
end

