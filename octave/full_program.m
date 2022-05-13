

T = load_all_images(true);

reduction = 100;
[ S, U1, U2 ,U3 , U4 ] = MyHOSVD( T ,reduction);

Tau = fold(U4 * unfold(S,4)   ,4 , [10 9 36 6400]);

Tpixels = unfold(Tau ,4);

Ppixels = (pinv(Tpixels))';

fprintf(1, 'Ppixels done\n');

P = fold(Ppixels,4,[10 9 36 6400]);

##check_test_set(P,U1);
