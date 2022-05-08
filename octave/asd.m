##IMAGES = zeros(3240,40000);

TENZOR = zeros (10, 9, 36, 40000,"uint32");

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
        fprintf(1, 'Now reading %d %s\n',k, full_filename);
       
        TENZOR(p+1,1 - (a/4),l_iter,:) = img_1d;

        k = k+1;
        l_iter =  l_iter +1;
            

    end
  end
end
end



T1 = unfold(TENZOR,1);
T2 = unfold(TENZOR,2);
T3 = unfold(TENZOR,3);



