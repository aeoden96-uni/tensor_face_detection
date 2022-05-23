function [] = testing(P,U1,person)
  addpath("help_functions");
  pkg load image
  resize_to = 80;

  fprintf(1, '\nTest start:\n');
  myDir = "data/test/";
  myFiles = dir(myDir);

  images_print = 1;

  fprintf(1, '\nTest dir: %s\n',myDir);
  fprintf(1, '\nN = %d\n',length(myFiles)-2);
  for k = 3:length(myFiles)
    baseFileName = myFiles(k).name;


    img_test_2d = imread(strcat(myDir,baseFileName));
    img_test_2d = imresize(img_test_2d, [resize_to resize_to]);
    img_test_1d = reshape(img_test_2d,1,[]);
    img_test_1d =double(img_test_1d);

    R = fold(img_test_1d * unfold(P,4)   ,4, [10 9 36 1]);
    [ Z, V1, V2, V3 ] = HOSVD( R );

    S1_ = main_test_loop( V1,V2,V3 , R );
    rez = check_person(U1, S1_);



    if (rez - 1 == person)
      fprintf(1, '\nExample: %s\n',baseFileName);
      fprintf(1, '   PERSON %d \n',rez - 1);
      subplot(2,2,images_print),imshow(imread(strcat(myDir,baseFileName)));
      images_print = images_print + 1;
    endif

    if (images_print > 3)
      break
    endif

  endfor

   if(person >=6)
        correct_person = strcat("data/training-synthetic/000",num2str(person),"_-4_0_0_0_15_0_1.pgm");
   else
        correct_person = strcat("data/training-synthetic/000",num2str(person),"_-4_0_0_15_0_1.pgm");

   endif

##   [X1,map1] = imread(correct_person);
   subplot(2,2,4), imshow(imread(correct_person));


end
