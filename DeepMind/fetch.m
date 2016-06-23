function X = fetch(D)

D_prim = D;
if size(D,1) < 10
    X = [];
else
    for k = 1:10
        a = randi(size(D_prim,1));
        X(k,:) = D_prim(a,:);
        index = true(1,size(D_prim,1));
        index(a) = false;
        D_prim = D_prim(index,:);
    end
end

end