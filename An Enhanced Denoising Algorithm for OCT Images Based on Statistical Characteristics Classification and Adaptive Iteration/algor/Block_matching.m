function  [Init_Index]  =  Block_matching(X, par,Neighbor_arr,Num_arr, SelfIndex_arr)
L         =   length(Num_arr);
Init_Index   =  zeros(par.patnum,L);

for  i  =  1 : L
    Patch = X(:,SelfIndex_arr(i));
    Neighbors = X(:,Neighbor_arr(1:Num_arr(i),i));
%     Correlation distance
%     DR=[(repmat(Patch,1,size(Neighbors,2)))'; Neighbors'];
%     Dist = pdist(DR, 'correlation');   
% %     Geman-McClure distance
%     Dist = sum(Neighbors./(1+(repmat(Patch,1,size(Neighbors,2))-Neighbors).^2).^2);
% %     Bray¨Ccurtis distance
%     Dist = sum(abs((repmat(Patch,1,size(Neighbors,2))-Neighbors)))./sum(((repmat(Patch,1,size(Neighbors,2))-Neighbors)));
% %    Manhattan distance
%     Dist = sum(abs((repmat(Patch,1,size(Neighbors,2))-Neighbors)));
% %  Pearson distance
%     Dist = sum((repmat(Patch,1,size(Neighbors,2))-Neighbors).^2 ./repmat(Patch,1,size(Neighbors,2)));
% %  Chi-Square distance
     Dist = sum((repmat(Patch,1,size(Neighbors,2))-Neighbors).^2 ./((repmat(Patch,1,size(Neighbors,2))+Neighbors)));
% %  Euclidean distance
%     Dist = sum((repmat(Patch,1,size(Neighbors,2))-Neighbors).^2);
% %  Square chord distance
%     Dist = sum((sqrt(repmat(Patch,1,size(Neighbors,2)))-sqrt(Neighbors)).^2);
% %  Weighted-absolute distance
%   Dist = sum(abs(repmat(Patch,1,size(Neighbors,2))-Neighbors)./var((repmat(Patch,1,size(Neighbors,2)))-var(Neighbors)));
    
    [val index] = sort(Dist);
    Init_Index(:,i)=Neighbor_arr(index(1:par.patnum),i);
end
