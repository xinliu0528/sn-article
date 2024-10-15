     function [X W r]   =   WNNMs(Y,nSig ,m, Par)
[U0,S0,V0]    =   svd(full(Y),'econ');
S0            =   diag(S0);
Sigma0          =S0;
% thr               =   0.3*Sigma0;
thr               =  nSig * sqrt(2 * log(length(Sigma0)));
S                 =   thre2(Sigma0, thr);
U                 =   U0;
V                 =   V0;
X                 =   U*diag(S)*V';
% wei               =   1/size(Y,1); 
% wei =  mean_S / max(S0);
wei = CalculateWei(Y, Par);
% wei
X                 =   (X).*wei;
X                 =   X + m;
return;
