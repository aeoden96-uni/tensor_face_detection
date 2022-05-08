##IMAGES = zeros(3240,40000);

TENZOR = zeros (10, 9, 40000);

myDir = "/run/media/mateo/Personal/projects/py/ml/tensors/data/training-synthetic/"; 
myFiles = dir(fullfile(myDir,'*.pgm')); 

k = 1
for p = 0:9
  p_str = strcat("000", num2str(p),"_"); 
  for a = [0 -4 -8 -12 -16 -20 -24 -28 -32]   
    a_str = strcat(num2str(a),"_0_0_"); 
    if (p >=6)
      a_str = strcat(a_str,"0_"); 
    endif
    l_iter = 1;
    for l1 = [15 30 45 60 75 90]
      
      l1_str =strcat (num2str(l1),"_");
      for l2 = [0 15 30 45 60 75]
        l2_str =strcat( num2str(l2),"_");
        
        full_filename = strcat(p_str, a_str,  l1_str, l2_str , "1.pgm");
        img_original = imread(strcat(myDir,full_filename));
        img_1d = reshape(img_original,1,[]);
##      IMAGES(k,:) = img1D;
        TENZOR(p+1,1 - (a/4),:) = img_1d;
        fprintf(1, 'Now reading %d %s\n',k, full_filename);
       
        

        k = k+1;
        l_iter =  l_iter +1;
            
        break
    end
    break
  end
end
end




##[ S, U1, U2, U3 ] = HOSVD0( TENZOR );
##Tau = ten_mat_mult(S,U3,3);
##Tpixels = unfold(Tau,3);
##Ppixels = (pinv(Tpixels))';
##P = fold(Ppixels, 3, dT);

##img_test_2d = imread("/run/media/mateo/Personal/projects/py/ml/tensors/data/training-synthetic/0000_-4_0_0_15_15_1.pgm");
## img_test_1d = reshape(img_test_2d,1,[]);
## img_test_1d_double =im2double(img_test_1d)*255;
## R = ten_mat_mult(P, img_test_1d_double, 3);

##[Z, V1, V2 ] = MyHOSVD(R);  %samo nam Z treba




