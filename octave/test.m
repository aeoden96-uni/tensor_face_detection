function ii = test(U1, S1_)

  N=1000;
  ii = 1;
  for i=1:10
    X = U1(i,:);

    n = norm(S1_' - X);

    if(i == 1)
      N = n;
      ii = 1;
    elseif (N > n)
      N = n;
      ii = i;
    endif

  endfor

##  fprintf(1, 'Person number: %d\n',ii);


endfunction
