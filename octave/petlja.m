function [ S1 ] = petlja( V1,V2 ,V3 ,R)

  S1 = V1(:,1);
  S2 = V2(:,1);
  S3 = V3(:,1);
  fprintf(1, 'LOOP\n');
  tolerance = 10e-4;
  ii= 1;

  old_norm = 1000;

  while true

      U1_ = ten_mat_mult(ten_mat_mult(R,S2',2), S3', 3);
      [unf_U1_,~,~] = svd(U1_);
      S1 = unf_U1_(:,1);

      U2_ = ten_mat_mult(ten_mat_mult(R,S1',1), S3', 3);
      [unf_U2_,~,~] = svd(U2_');
      S2 = unf_U2_(:,1);

      U3_ = ten_mat_mult(ten_mat_mult(R,S1',1), S2', 2);

      U3_sque = squeeze(U3_);

      [unf_U3_,~,~] = svd(U3_sque);
      S3 = unf_U3_(:,1);

      Z_ = ten_mat_mult(U3_, S3', 3); #1x1

      R_ = S1;

      R_ = (S2 * R_')';  #10x9

      R_ = S3 * reshape(R_,90,[])'; #36x90

      R_ = fold(R_ , 3 , [10 9 36]); #10x9x96

      new_norm = R-R_;
      new_norm = norm(new_norm(:),"fro");

      fprintf("%f\n", new_norm);
      ii = ii+1;


      if(abs(old_norm-new_norm) < tolerance) break
      endif

      old_norm = new_norm;

      if(ii > 40) break
      endif



  endwhile

endfunction
