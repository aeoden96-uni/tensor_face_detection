function result = check_person(U1, S1_,print_res = false)

  N=1000;
  result = 1;
  for person=1:10
    X = U1(person,:);
    n = norm(S1_' - X);

    if(person == 1)
      N = n;
      result = 1;
    elseif (N > n)
      N = n;
      result = person;
    endif

  endfor

  if (print_res)
    fprintf(1, 'Person number: %d\n',result);
  endif

endfunction
