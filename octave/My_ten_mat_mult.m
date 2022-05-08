function Y = My_ten_mat_mult( T, M, mode )
% Transformira tenzor T reda 3 u matricu operacijom unfold u zadanom modu.
%
% Dio nastavnog materijala na  
% PMF-Matematicki odsjek, Sveuciliste u Zagrebu
% Diplomski kolegij Uvod u slozeno pretrazivanje podataka (© Zlatko Drmac)
%
% Ulazni parametri
% ================
% T    - tenzor reda 3
% M    - matrica 
% mode - mod u kojem mnozimu T x_mode M 
% Izlazni parametri
% =================
% Y = T x_mode M
%..........................................................................
dY = size(T) ; 
dY(mode) = size(M,1) ; 

##fprintf(1, '[TMM] dy = %d \n',dY);
##dY


if ( mode == 1 )
##   Y = Myfold( M * T, mode, dY ) ; 
Y = M*T;
   
   
elseif(mode == 2 )
##   Y = Myfold( M * T', mode, dY ) ;
Y =  M * T';
  
   
endif



##if ( size(M,2) ~= size(T,mode) )
##    error('>> broj stupaca matrice razlicit od odg. dimenzije tenzora!')
##end
##dY = size(T) ; dY(mode) = size(M,1) ; 
##
##Y = Myfold( M * unfold(T, mode), mode, dY ) ; 
##end