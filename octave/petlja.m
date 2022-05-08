function [ Z ] = petlja( V1,V2 ,R )

  S1 = V1(:,1);
  S2 = V2(:,1);

  tolerance = 10e-4;

  while true
      
      U1_ = My_ten_mat_mult(R, S2', 2);
      
      [U1,~,~] = svd(U1_);
      
      S1 = U1(:,1);
      
      U2_ = My_ten_mat_mult(My_ten_mat_mult(R,S1',1), S2', 2);
      
      [U2,~,~] = svd(U2_');
      
      S2 = U2(:,1);
      
      
      disp('U1_');
      size(U1_)
      disp('U1');
      size(U1)
      disp('U2_');
      size(U2_)
      disp('U2');
      size(U2)
      disp('S1');
      size(S1)
      disp('S2');
      size(S2)
      Z = My_ten_mat_mult(U2_, S2, 2);
      
##      if (.. < tolerance) break; endif
      break

  endwhile

end