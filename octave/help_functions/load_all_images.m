function [ T ] = load_all_images(quality = 200)

pkg load image

myDir = "data/training-synthetic/";


T = zeros (10, 9, 36, quality*quality);


myFiles = dir(fullfile(myDir,'*.pgm'));

k = 1;
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

        img_original = imresize(img_original, [quality quality]);
        img_1d = reshape(img_original,1,[]);


        T(p+1,1 - (a/4),l_iter,:) = img_1d;


        fprintf(1, 'Now reading %d %s\n',k, full_filename);

        k = k+1;
        l_iter =  l_iter +1;


    end
  end
end
end

end
