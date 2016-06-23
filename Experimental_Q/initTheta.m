function [ThetaStruct] = initTheta(X, layerstructure)

% Create NN with layerstructure and add input and output layer with single
% neuron
inputlayer = size(X,2);
layerstructure = [inputlayer layerstructure 1];
numberOfLayers = length(layerstructure) - 1;

for i = 1:numberOfLayers
    ThetaStruct{i} = randWeights(layerstructure(i), layerstructure(i+1));
end

end