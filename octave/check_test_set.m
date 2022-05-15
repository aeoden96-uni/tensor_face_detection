function [] = check_test_set(P,U1)
  addpath("help_functions");

  resize_to = 200;

  fprintf(1, '\nTest start:\n');
  myDir = "data/test/";
  myFiles = dir(myDir);

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

    correct_person = str2num(strsplit(baseFileName,"_")(1){:}) + 1;
    if (correct_person == rez)
      rez_str = "OK";
    else
      rez_str = "";
    endif

    fprintf(1, '%d %s  %s\n',rez,baseFileName, rez_str);

  endfor

end
