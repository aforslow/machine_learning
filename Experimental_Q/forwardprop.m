function aval = forwardprop(X, ThetaStruct)
    nLayers = length(ThetaStruct); %Layers of synapses in this case (not neurons)
    Xval = X(1,:); %Make sure X is only a vector, not matrix
    a{1} = Xval;
    for i = 1:nLayers
        a{i} = [1 a{i}];
        z{i+1} = a{i}*ThetaStruct{i}';
        a{i+1} = sigmoid(z{i+1});
    end

    lastLayer = length(ThetaStruct)+1;
    aval = a{lastLayer};


end