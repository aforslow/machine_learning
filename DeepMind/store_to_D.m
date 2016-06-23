function D = store_to_D(phi_t, a_t, r_t, phi_t1, j)

% disp(phi_t);
% disp(a_t);
% disp(r_t);
% disp(phi_t1);
max_num = 100000;
if exist('D_matrix.mat', 'file')
    D = importdata('D_matrix.mat');
    if size(D,1) == max_num
        D(randi(max_num),:) = [phi_t a_t r_t phi_t1 j];
    else
        D(size(D,1)+1,:) = [phi_t a_t r_t phi_t1 j];
    end
else
    D = [phi_t a_t r_t phi_t1 j];
end

save('D_matrix.mat','D');





end