x = [1 0 0 0; 1 2 0 0; 1 2 3 0; 1 2 3 4];

z = phi_func(x,3);
[V,~] = eig(x'*x);
Vred = V(:,1:2);
z12 = V'*x';
disp(z12);