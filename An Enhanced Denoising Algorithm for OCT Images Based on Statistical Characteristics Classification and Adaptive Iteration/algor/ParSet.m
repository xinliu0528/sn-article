function  [par]=ParSet(nSig)

par.nSig      =   nSig;                                 % Variance of the noise image
par.SearchWin =   21;                                   % Non-local patch searching window
% par.delta     =   0.1;                                  % Parameter between each iter
par.c         =  5*sqrt(2);                              % Constant num for the weight vector 5*sqrt(2)
par.d         =  1.25*sqrt(2);
par.Innerloop =   2;                                    %1.25*sqrt(2) InnerLoop Num of between re-blockmatching
par.ReWeiIter =   3;
par.patsize       =   17;
par.patnum        =   90;
par.Iter          =   10;
par.lamada        =   0.83; 

par.step      =   floor((par.patsize)/2-1);                   
% Blockmatching and perform WNNM algorithm on all the patches in the image
% is time consuming, we just perform the blockmatching and WNNM on parts of
% patches in the image (we call these patches keypatch in explanatory notes)
% par.step is the step between each keypatch, smaller step will further
% improve the denoisng result