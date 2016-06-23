function seq_mat = store_sequence(sequence, nElements)


if exist('sequence_matrix.mat', 'file')
    seq_mat = importdata('sequence_matrix.mat');
    m = size(seq_mat,1);
    if m < 63
        seq_vec = zeros(1,nElements);
        seq_vec(1,1:size(sequence,2)) = sequence;
        seq_mat(m+1,:) = seq_vec;
    end
else
    seq_vec = zeros(1,nElements);
    seq_vec(1,1:size(sequence,2)) = sequence;
    seq_mat = seq_vec;
end
save('sequence_matrix.mat','seq_mat');

end