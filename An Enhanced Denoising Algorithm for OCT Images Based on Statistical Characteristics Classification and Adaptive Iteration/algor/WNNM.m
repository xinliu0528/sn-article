
function  [X] =  WNNM( Y, C, NSig, m, Iter )
    [U,SigmaY,V] =   svd(full(Y),'econ'); 
%     [U1,V1] =   qr(U);
%     [U2,V2] =   qr(V);
    PatNum       = size(Y,2);
    TempC  = C*sqrt(PatNum)*2*NSig^2;
    [SigmaX,svp] = ClosedWNNM(SigmaY,TempC,eps);                        
%     X =  U(:,1:svp)*diag(SigmaX)*V(:,1:svp)' + m; 
% SigmaV1=((V1))*0.95;
% U=U1*SigmaV1;
% SigmaV2=(V2)*0.99;
% V=U2*SigmaV2;
 X = U(:,1:svp)*diag(SigmaX)*V(:,1:svp)' + m; 

return;
