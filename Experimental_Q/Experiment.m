X = [2 3 1; 1 4 2; 2 4 3];
layerstructure = 4;
Theta = initTheta(X,layerstructure);
reward = 1;
lambda = 0.8;
m = size(X,1);

BigDelta = initBigDelta(Theta);

for i = 1:size(X,1)
    thisX = X(i,:);
    [grad, BigDelta] = nnCompute(thisX, lambda, Theta, reward, BigDelta);
    
end

for i = 1:length(grad)
    grad{i} = 1/m*grad{i};
    BigDelta{i} = 1/m*BigDelta{i};
end
