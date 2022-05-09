##function [X] = MyUnfold( T, dim, i )
##X = reshape(shiftdim(T,i-1), dim(i), []);
##
##end
function T1 = MyUnfold(A,n)
  d = size(A);
  T1 = reshape(shiftdim(A,n-1), d(n), []);
end

