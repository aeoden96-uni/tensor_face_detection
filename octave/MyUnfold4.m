function [T1,T2,T3,T4] = MyUnfold4(A)
  d = size(A);
  
  T1 = reshape(shiftdim(A,1-1), d(1), []);
  T2 = reshape(shiftdim(A,2-1), d(2), []);
  T3 = reshape(shiftdim(A,3-1), d(3), []);
  T4 = reshape(shiftdim(A,4-1), d(4), []);
  
end