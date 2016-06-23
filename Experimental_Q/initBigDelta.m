function BigDelta = initBigDelta(Theta)
    %Create BigDelta for use in nnCompute
    for i = 1:length(Theta)
        BigDelta{i} = zeros(size(Theta{i}));
    end
end