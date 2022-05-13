function Y = TMM( T, M, mode )
% Transformira tenzor T reda 3 u matricu operacijom unfold u zadanom modu.


if(mode == 4)
##	d = 100;
 d= 3240;
else
	d = 6400;

endif

Y = fold(M * unfold(T,mode)   ,mode , [10 9 36 d]);

end

