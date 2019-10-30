function retval = Gauss_seidel (A,B)
  [m,n] = size(A);
  for i = 1:m
    diag(i) = A(i,i);
    rest(i,:) = [A(i,1:i-1) A(i,i+1:n)];
    row_sum = sum(abs(rest(i,:)));
    if abs(diag(i)) <= row_sum
      retval = 'Diagonally Not dominated';
      return;
    end
  end
  X = zeros(1,n);
  retval(1,:) = X;
  for i = 2:50
    temp = X(1);
    for j = 1:n
      Xrest = [X(1:j-1) X(j+1:n)];
      fprintf( "(%i) ",j);
      fprintf( "%0.5f ",Xrest);
      retval(i,j) = (B(j)-rest(j,:)*Xrest')/diag(j);  
      X = retval(i,:);
    end
    fprintf( "\n");
    if abs(temp - retval(i,1)) < 0.0001
      break;
    end
    X = retval(i,:);
  end
endfunction
