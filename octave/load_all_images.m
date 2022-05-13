function [ T ] = load_all_images(all = false)

pkg load image

myDir = "data/training-synthetic/";


T = zeros (10, 9, 6400);
if (all)
  T = zeros (10, 9, 36, 6400);
endif

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

        image_resized = imresize(img_original, [80 80]);
        img_1d = reshape(image_resized,1,[]);
##      IMAGES(k,:) = img1D;


        if (all)
          T(p+1,1 - (a/4),l_iter,:) = img_1d;
        else
          T(p+1,1 - (a/4),:) = img_1d;
        endif

        fprintf(1, 'Now reading %d %s\n',k, full_filename);

        k = k+1;
        l_iter =  l_iter +1;

        if (all == false) break
        endif

    end
    if (all == false) break
    endif
  end
end
end

end
