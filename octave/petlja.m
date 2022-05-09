function [ Z ] = petlja( V1,V2 ,V3 ,R , Z = ten_mat_mult(U2_, S3, 3); )

  S1 = V1(:,1);
  S2 = V2(:,1);
  S3 = V3(:,1);

  tolerance = 10e-4;

  while true
      
      U1_ = ten_mat_mult(ten_mat_mult(R,S2',2), S3', 3);
      [unf_U1_,~,~] = svd(U1_);
      S1 = unf_U1_(:,1);
      
      U2_ = ten_mat_mult(ten_mat_mult(R,S1',1), S3', 3);
      [unf_U2_,~,~] = svd(U2_');
      S2 = unf_U2_(:,1);
    
      U3_ = ten_mat_mult(ten_mat_mult(R,S1',1), S2', 2);
      [unf_U3_,~,~] = svd(U3_);
      S3 = unf_U3_(:,1);
      
      Z = ten_mat_mult(U3_, S3, 3);
      
##      if (.. < tolerance) break; endif
      break

  endwhile

end