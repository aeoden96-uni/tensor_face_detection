function [] = check_test_set(P,U1)

  fprintf(1, 'start\n');
  myDir = "data/test/";
  myFiles = dir(myDir);


  for k = 3:length(myFiles)

    baseFileName = myFiles(k).name;
    img_test_2d = imread(strcat(myDir,baseFileName));

##    img_test_2d = imread(test_img_dir);
    img_test_2d = imresize(img_test_2d, [80 80]);

    img_test_1d = reshape(img_test_2d,1,[]);
    img_test_1d =double(img_test_1d);

    R = fold(img_test_1d * unfold(P,4)   ,4, [10 9 36 1]);

##    fprintf(1, 'R done \n');

    [ Z, V1, V2, V3 ] = HOSVD( R );

    S1_ = petlja( V1,V2,V3 , R );

    rez = test(U1, S1_);

    correct_person = str2num(strsplit(baseFileName,"_")(1){:}) + 1;
    if (correct_person == rez)
      rez_str = "OK";
    else
      rez_str = "";
    endif

    fprintf(1, '%d %s  %s\n',rez,baseFileName, rez_str);

  endfor

end
