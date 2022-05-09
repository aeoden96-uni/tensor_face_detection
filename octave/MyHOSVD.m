function [ S, U1, U2 ,U3 , U4 ] = MyHOSVD( A )
% Racuna HOSVD tenzora A.
%
% Dio nastavnog materijala na  
% PMF-Matematicki odsjek, Sveuciliste u Zagrebu
% Diplomski kolegij Uvod u slozeno pretrazivanje podataka (© Zlatko Drmac)
%
% Ulazni parametri
% ================
% A - tenzor reda 3 
% Izlazni parametri
% =================
% S - jezgreni tenzor, istih dimenzija kao i A 
% U1, U2, U3 - ortogonalne matrice 
% Vrijedi A = S x_1 U1 x_2 U2 x_3 U3
%.......................................................................... 

[T1,T2,T3,T4] = MyUnfold4(A);

[n1,n2,n3,n4] = size (A);

[ U1, ~, ~ ] = svds( T1 ,min(n1,n2*n3*n4)) ;

fprintf(1, 'SVDS 1 done\n');

[ U2, ~, ~ ] = svds( T2 ,min(n2,n1*n3*n4)) ;

fprintf(1, 'SVDS 2 done\n');

[ U3, ~, ~ ] = svds( T3 ,min(n3,n2*n1*n4)) ;

fprintf(1, 'SVDS 3 done\n');

[ U4, ~, ~ ] = svds( T4 ,100) ;

fprintf(1, 'SVDS 4 done\n');

S = TMM(TMM(TMM(TMM(A,U1',1),U2',2),U3',3),U4',4) ; 

end