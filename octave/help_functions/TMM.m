function Y = TMM( T, M, mode)


if(mode == 4)
  #T  10 9 36 40000
  #M  100 40000

  d = size(M)(2);
else
	d = 40000;
endif
              #40000x3240
Y = fold(M * unfold(T,mode)   ,mode , [10 9 36 d]);
          #100x3240
end

