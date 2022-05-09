function Y = TMM( T, M, mode )
% Transformira tenzor T reda 3 u matricu operacijom unfold u zadanom modu.


##dY = size(T) ; 
##dY(mode) = size(M,1) ; 

if(mode == 4)

  Y = MyFold4(M * MyUnfold(T,mode)   ,mode , [10 9 36 100]);
  
else 
  Y = MyFold4(M * MyUnfold(T,mode)   ,mode , [10 9 36 6400]);

endif



end

