##function [X] = MyUnfold( T, dim, i )
##X = reshape(shiftdim(T,i-1), dim(i), []);
##
##end
function [T1,T2,T3,T4] = MyUnfold4(A,n)
  d = size(A)
  X = reshape(shiftdim(A,n-1), d(n), []);
end