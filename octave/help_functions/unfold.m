function M = unfold( T, mode )
% Transformira tenzor T reda 3 u matricu operacijom unfold u zadanom modu.
%
% Dio nastavnog materijala na
% PMF-Matematicki odsjek, Sveuciliste u Zagrebu
% Diplomski kolegij Uvod u slozeno pretrazivanje podataka (© Zlatko Drmac)
%
% Ulazni parametri
% ================
% T    - tenzor reda 3
% mode - mod u kojem  radimo unfold
% Izlazni parametri
% =================
% M    - matrica ciji su stupci niti u modu "mode" u odabranom poretku
%..........................................................................
tensor_dim = size(size(T))(2);

M = reshape(shiftdim(T,mode-1), size(T)(mode), []);

endfunction
