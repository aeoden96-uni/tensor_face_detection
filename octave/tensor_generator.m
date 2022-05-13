function T = tensor_generator(d = [3 2 2 2])
  
  if (size(d)(2) == 4)
    
    R = [1:d(1)*d(2)];
    R = reshape(R,d(2),[])'; 
    
    T = zeros (d(1), d(2), d(3), d(4));
    
    k = 0;
    for i = 1: d(4)
      for j = 1: d(3)
        T(:,:,j,i)= R + d(1)*d(2)*k;
        k = k+1;
      endfor
    endfor
    
  elseif(size(d)(2) == 3)
    
    R = [1:d(1)*d(2)];
    R = reshape(R,d(2),[])'; 
    
    T = zeros (d(1), d(2), d(3));
    
    k = 0;
    for i = 1: d(3)
      T(:,:,i)= R + d(1)*d(2)*k;
      k = k+1;
    endfor
  
  
  else
    error("wrong dims");
  endif
  
 
  
endfunction
