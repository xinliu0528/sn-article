function [ EPat W ] = PatEstimationp( NL_mat, Self_arr, Sigma_arr, CurPat, Par,N_Img)
        img1 = N_Img;
        EPat = zeros(size(CurPat));
        W    = zeros(size(CurPat));
        for  i      =  1 : length(Self_arr)                                 % For each keypatch group
            Temp    =   CurPat(:, NL_mat(1:Par.patnum,i)); 
       
           Temp = double(Temp); 
            TE      =   sort((Temp(:,1)));

            avgEntropy = mean2(entropy(img1));
            stdc = std((img1));
            rows1 = size(img1, 2);
            patd = Par.patsize / rows1;
            k = 0.8;
           entropy_threshold = avgEntropy * ( 1 - (k *(1 - exp(-stdc-patd)) / (1 + exp(-patd-stdc))))/100;
%             entropy_threshold = 0.0520;
            variance_threshold = var(TE(:)) - 1;

            
            entropy_value = entropy(TE);
            variance_value = var(TE(:));

      %      T_mean   =   mean(TE);
       %     T_sum = (TE(1) + TE(2)+ TE(3) + TE(4) + TE(5) + TE(6))/6;
            M_Temp  =   repmat(mean( Temp, 2 ),1,Par.patnum);
            Temp    =   Temp-M_Temp;
%               E_Temp 	=  WNNMs( Temp,Sigma_arr(Self_arr(i)),M_Temp, Par);
            if entropy_value > entropy_threshold && variance_value > variance_threshold
               E_Temp 	=  WNNMs( Temp,Sigma_arr(Self_arr(i)),M_Temp, Par);
%                 E_Temp 	=   WNNM( Temp, Par.c, Sigma_arr(Self_arr(i)), M_Temp, Par.ReWeiIter);
            else
%               E_Temp 	=  WNNMs( Temp,Sigma_arr(Self_arr(i)));
               E_Temp 	=   WNNM( Temp, Par.d, Sigma_arr(Self_arr(i)), M_Temp, Par.ReWeiIter);
%                   E_Temp 	=  WNNMs1( Temp,Sigma_arr(Self_arr(i)));
            end
% % 
%             E_Temp 	=   WNNM( Temp, Par.c, Sigma_arr(Self_arr(i)), M_Temp, Par.ReWeiIter); % WNNM Estimation
            EPat(:,NL_mat(1:Par.patnum,i))  = EPat(:,NL_mat(1:Par.patnum,i))+E_Temp;      
            W(:,NL_mat(1:Par.patnum,i))     = W(:,NL_mat(1:Par.patnum,i))+ones(Par.patsize*Par.patsize,size(NL_mat(1:Par.patnum,i),1));
        end
end

