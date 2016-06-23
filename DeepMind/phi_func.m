function z = phi_func(sequence,k)

load('sequence_matrix.mat','seq_mat');
% disp(seq_mat);
m = size(seq_mat,1);
corr_seq = zeros(1,size(seq_mat,2));
corr_seq(:,1:size(sequence,2)) = sequence;

Sigma = 1/m*(seq_mat'*seq_mat);
[U, ~, ~] = svd(Sigma);
Ureduce = U(:,1:k);
% disp(Ureduce);
% disp(corr_seq');
z = Ureduce'*corr_seq';
% disp(z);
% disp(U);
% pause();

end