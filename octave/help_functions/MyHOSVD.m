function [ S, U1, U2 ,U3 , U4 ] = MyHOSVD( A,reduction = 100 )
% Racuna HOSVD tenzora A.

T1 = unfold(A,1);
T2 = unfold(A,2);
T3 = unfold(A,3);
T4 = unfold(A,4);
[n1,n2,n3,n4] = size (A);

[ U1, ~, ~ ] = svds( T1 ,min(n1,n2*n3*n4)) ;
fprintf(1, 'SVDS 1 done\n');

[ U2, ~, ~ ] = svds( T2 ,min(n2,n1*n3*n4)) ;
fprintf(1, 'SVDS 2 done\n');

[ U3, ~, ~ ] = svds( T3 ,min(n3,n2*n1*n4)) ;
fprintf(1, 'SVDS 3 done\n');

if(reduction == 0)
  reduction = min(n4,n1*n2*n3);
endif

[ U4, ~, ~ ] = svds( T4 ,reduction) ;
fprintf(1, 'SVDS 4 done\n');

S = TMM(TMM(TMM(TMM(A,U1',1),U2',2),U3',3),U4',4) ;

end
