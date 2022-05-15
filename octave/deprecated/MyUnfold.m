function Tn = MyUnfold(A,n)
  d = size(A);
  Tn = reshape(shiftdim(A,n-1), d(n), []);
end

