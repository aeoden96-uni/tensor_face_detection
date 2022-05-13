function T = fold( M, mode, dT )
% Matricu M prepakira u tenzor reda tri s dimenzijama danim u deskriptoru
% dT.
%
% Dio nastavnog materijala na
% PMF-Matematicki odsjek, Sveuciliste u Zagrebu
% Diplomski kolegij Uvod u slozeno pretrazivanje podataka (© Zlatko Drmac)
%
% Ulazni parametri
% ================
% M    - matrica ciji stupci postaju niti u modu "mode" izlaznog tenzora T
% mode - mod u kojem radimo transformaciju
% dT   - dimenzije ciljanog tenzora reda tri, dT(1) x dT(2) x dT(3)
% Izlazni parametri
% =================
% T    - tenzor dimenzija danih u polju dT, cije niti u modu "mode" su
%        stupci ulazne matrice M. Transformacija je uskladjena s definicijom
%        funkcije unfold.
%..........................................................................
tensor_dim = size(dT)(2);

switch tensor_dim
	case 3
		n1 = dT(1);
		n2 = dT(2) ;
		n3 = dT(3) ;

		switch mode
			case 1
				T = reshape(M,n1,n2,n3);
			case 2
				T = reshape(M,n2*n3,[])';
				T = reshape(T,n1,n2,n3);
			case 3
				T = reshape(M,n1*n3,[])';
				T = reshape(T,n2*n3,[])';
				T = reshape(T,n1,n2,n3);
		endswitch
	case 4
		n1 = dT(1) ;
		n2 = dT(2) ;
		n3 = dT(3) ;
		n4 = dT(4) ;

		switch mode
			case 1
				T = reshape(M,n1,n2,n3,n4);
			case 2
				T = reshape(M',n3*n4,[])';
				T = reshape(T,n1,n2,n3,n4);
			case 3
				T = reshape(M',n1,[]);
				T = reshape(T',n4,[])';
				T = reshape(T,n2*n3*n4,[])';
				T = reshape(T,n1,n2,n3,n4);
			case 4
				T = reshape(M',n1,n2,n3,n4);
		endswitch
	endswitch
end

