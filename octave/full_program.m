function [ ] = full_program()
  
TENZOR = load_all_images();


[ S, U1, U2, U3 ] = HOSVD0( TENZOR );
Tau = ten_mat_mult(S,U3,3);
Tpixels = unfold(Tau,3);
Ppixels = (pinv(Tpixels))';
P = fold(Ppixels, 3, dT);

img_test_2d = imread("/run/media/mateo/Personal/projects/py/ml/tensors/data/training-synthetic/0000_-4_0_0_15_15_1.pgm");
img_test_1d = reshape(img_test_2d,1,[]);
img_test_1d_double =im2double(img_test_1d)*255;
R = ten_mat_mult(P, img_test_1d_double, 3);

[Z, V1, V2 ] = MyHOSVD(R);  %samo nam Z treba

? = petlja( V1,V2 );
  
  
end