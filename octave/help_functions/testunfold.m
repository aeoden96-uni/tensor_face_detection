k = 3;

if(k ==3)
  d = [4 3 2];

  T  = tensor_generator(d);

  T1 = unfold(T, 1);  #4x6
  T2 = unfold(T, 2);  #3x8
  T3 = unfold(T, 3);  #2x12

  A = fold(T1, 1, d);
  B = fold(T2, 2, d);
  C = fold(T3, 3, d);

elseif (k==4)

  d = [5 4 3 2];

  T = tensor_generator(d);

  T1 = unfold(T, 1);  # 5x24
  T2 = unfold(T, 2);  # 4x30
  T3 = unfold(T, 3);  # 3x40
  T4 = unfold(T, 4);  # 2x60


  A = fold(T1,1,d);
  B = fold(T2,2,d);
  C = fold(T3,3,d);
  D = fold(T4,4,d);

endif






