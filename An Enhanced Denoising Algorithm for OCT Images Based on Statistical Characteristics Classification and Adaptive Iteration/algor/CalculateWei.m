function wei = CalculateWei(Y, par)
    local_size = [3, 3];
    local_mean = conv2(Y, ones(local_size) / prod(local_size), 'same');
    Y_squ = conv2(Y.^2, ones(local_size) / prod(local_size), 'same');
    local_var = Y_squ - local_mean.^2;
    local_var(local_var == 0) = eps;

      localWei = mean(local_mean ./ sqrt(local_var));
%     localWei = mean(local_mean ./ sqrt(local_var), 'all');
%     noiseFactor = 1 - (par.nSig / 100); % nSig越大，权重应该相应减小
    noiseFactor = 1 - (par.nSig / 100); % nSig越大，权重应该相应减小
%     patFactor = sqrt(par.patnum) / 100; % 使用更多的块能带来更好的去噪效果
    patFactor = sqrt(par.patnum) / 100;
    
    adjustfac = 7;
    wei = localWei * noiseFactor * (1 + patFactor) * adjustfac;
    wei = max(0.1, min(wei, 1)); % 保持wei在0.1到1之间
end