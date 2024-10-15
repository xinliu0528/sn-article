% function delta = I2(X)
%     [m, n] = size(X);
%     delta = zeros(m, n);
%     windowSize = 15;
%     halfWindow = floor(windowSize / 2);
%     X_padded = padarray(X, [halfWindow halfWindow], 'replicate', 'both');
% 
%     for i = 1:m
%         for j = 1:n
%             localRegion = X_padded(i:i+windowSize-1, j:j+windowSize-1);
%             localStd = std2(localRegion);
%             localEntropy = entropy(localRegion);
%             
%             if localStd > 0.5 && localEntropy > 3.5 
%                 delta(i, j) = 0.01; 
%             else
%                 normalizedStd = localStd / max(0.01, std(localRegion(:)));
%                 normalizedEntropy = localEntropy / max(1, entropy(localRegion(:)));
% 
%                 delta(i, j) = 0.1 * (1 - 0.5 * normalizedStd - 0.5 * normalizedEntropy);
%                 delta(i, j) = max(0.01, min(delta(i, j), 0.1));
%             end
%         end
%     end
% end
% 



function delta = I2(X)
    [m, n] = size(X);
    delta = zeros(m, n);

    offsets = [0 1; -1 1; -1 0; -1 -1]; 
    numLevels = 16;

    glcm = graycomatrix(X, 'Offset', offsets, 'NumLevels', numLevels, 'Symmetric', true);
    stats = graycoprops(glcm, {'Contrast', 'Homogeneity'});

    average_contrast = mean(stats.Contrast);
    average_homogeneity = mean(stats.Homogeneity);

    if average_homogeneity > 0.5
        delta(:) = 0.01;
    else
        delta(:) = 0.1 * (1 - (average_contrast / max(stats.Contrast)));
    end
end


  


% function delta = I2(X)
%     [m, n] = size(X);
%     v = zeros(m, n);
% 
%     glcm = graycomatrix(X, 'Offset', [0 1]); 
%     stats = graycoprops(glcm, {'contrast', 'homogeneity'}); 
% 
%     for i = 1:m
%         for j = 1:n
%             contrast = stats.Contrast;
%             homogeneity = stats.Homogeneity;
% 
%             if homogeneity > 0.5
%                 v(i, j) = 0.01; 
%             else
%                 v(i, j) = 0.1 * (1 - (contrast / max(contrast)));
%             end
%         end
%     end
%     delta = v;
% end
