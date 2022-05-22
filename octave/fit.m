addpath("help_functions");

resize_to = 80;

T = load_all_images(resize_to);

[ S, U1, U2 ,U3 , U4 ] = MyHOSVD(T);

fprintf(1, 'MyHOSVD done\n');

if (exist ("P") != 1 && exist ("metadata/P.mat","file") ==2)
    fprintf(1, 'P already saved, loading...\n');
    load metadata/P.mat
elseif (exist ("P") != 1)
    Tau     = fold(U4 * unfold(S,4), 4, [10 9 36 resize_to*resize_to]);

    Tpixels = unfold(Tau ,4);

    Ppixels = (pinv(Tpixels))';
    fprintf(1, 'Ppixels done\n');


    P = fold(Ppixels,4,[10 9 36 resize_to*resize_to]);
endif

##check_test_set(P,U1);
