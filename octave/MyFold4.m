function T = MyFold4(A, mode, org)
  
##  org = [5 4 3 2];

  switch mode
    case 1
      T = reshape(A,org(1),org(2),org(3),org(4));
    case 2
      A = A';
      T = reshape(A,org(3)*org(4),[])';
      T = reshape(T,org(1),org(2),org(3),org(4));
      
    case 3
      A = A';
      A = reshape(A,org(1),[]);
      A = A';
      A = reshape(A,org(4),[])';
      A = reshape(A,org(2)*org(3)*org(4),[])';
      T = reshape(A,org(1),org(2),org(3),org(4));
    case 4
      
      T = reshape(A',org(1),org(2),org(3),org(4));
   
  endswitch      

endfunction








##t = 1 ;
##for p2 = 1:org(4)
##  q = 1;
##  for p1 = 1:org(3)
##    
##    switch mode
##        
##        case {1, 4}
##          T(:,:,p1,p2) = A(:,t:t+org(2) - 1);
##          t = t + org(2);
##        case 2
##          T(:,:,p1,p2) = A(t:org(4)*org(3):end,:);
##          t = t+1;
##        case 3
##          T(:,:,p1,p2) = A(p2:org(4):end,q:q + org(2) - 1);
##          q = q + org(2);
##
##    endswitch    
## 
##  endfor   
##endfor 
 
