 
    function [X W r]   =   WNNMs1(Y,nSig)
[U0,S0,V0]    =   svd(full(Y),'econ');
S0            =   diag(S0);
Sigma0=S0;
% S                 =   max( Sigma0.^2/size(Y, 2) - nSig^2, 0 );
thr               =   0.3*Sigma0;%  eq.(12);
S                 =   soft(Sigma0, thr);
U                 =   U0;
V                 =   V0;
X                 =   U*diag(S)*V';
wei           =   1/size(Y,1);     %确定权重
X                 =   (X )*wei;
    
return;
