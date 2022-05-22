function Y = TMM( T, U, mode)


if(mode == 4)
  d = size(U)(1);
else
  # d = 10 9 36
	d = 6400;
endif

Y = fold(U * unfold(T,mode)   ,mode , [10 9 36 d]);

end

