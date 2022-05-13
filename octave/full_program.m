function [ T, R ,P, S1_ , U1 ] = full_program()

  if (isequal(computer(),"x86_64-pc-linux-gnu"))
    test_img_dir = "../data/test/0000_02176.pgm";
  else
    test_img_dir = "..\\data\\test\\0000_02176.pgm";
  endif

  T = load_all_images(true);
  [ S, U1, U2 ,U3 , U4 ] = MyHOSVD( T );

  Tau = MyFold4(U4 * MyUnfold(S,4)   ,4 , [10 9 36 6400]);

  Tpixels = MyUnfold(Tau ,4);

  Ppixels = (pinv(Tpixels))';

  fprintf(1, 'Ppixels done\n');

  P = MyFold4(Ppixels,4,[10 9 36 6400]);


  img_test_2d = imread(test_img_dir);
  img_test_2d = imresize(img_test_2d, [80 80]);

  img_test_1d = reshape(img_test_2d,1,[]);
  img_test_1d =im2double(img_test_1d)*255;

  fprintf(1, 'Test image loaded\n');

  R = MyFold4(img_test_1d * MyUnfold(P,4)   ,4, [10 9 36 1]);

  fprintf(1, 'R done \n');

  [ Z, V1, V2, V3 ] = HOSVD( R );

  S1_ = petlja( V1,V2,V3 , R );

  test(U1, S1_);





end
