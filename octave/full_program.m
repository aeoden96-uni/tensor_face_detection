function [ ] = full_program()
  
TENZOR = load_all_images();


##[ S, U1, U2, U3 ] = HOSVD0( TENZOR );
##Tau = TMM(S,U4,4);

#main hosvd
Tau = MyFold4(U4 * MyUnfold(S,4)   ,4 , [10 9 36 6400]);

##Tpixels = unfold(Tau,3);
Tpixels = MyUnfold(Tau ,4);

##Ppixels = (pinv(Tpixels))';

P = MyFold4(Ppixels,4,[10 9 36 6400]);
##P = fold(Ppixels, 3, dT);

img_test_2d = imread("/run/media/mateo/Personal/projects/py/ml/tensors/data/training-synthetic/0000_-4_0_0_15_15_1.pgm");
img_test_1d = reshape(img_test_2d,1,[]);
img_test_1d_double =im2double(img_test_1d)*255;


##R = ten_mat_mult(P, img_test_1d_double, 3);
##R = TMM(P, img_test_1d_double', 4);

R = MyFold4(img_test_1d_double * MyUnfold(P,4)   ,4, [10 9 36 1]);

 [ Z, V1, V2 ,V3] = HOSVD( R );
 
 
##[Z, V1, V2 ] = MyHOSVD(R);  %samo nam Z treba

? = petlja( V1,V2,V3 , R ,Z );
  
  
end