## Author: Fazle Rakib <2017831030>
## Created: 2019-10-28

function retval = Bisection (f,a,b)
  fa(1) = f(a(1));
  fb(1) = f(b(1));
  c(1) = (a(1)+b(1))/2;
  fc(1) = f(c(1));
  
  for i = 2:50
    fa(i) = f(a(i-1));
    fb(i) = f(b(i-1));
    c(i) = (a(i-1)+b(i-1))/2;
    fc(i) = f(c(i));
    if fa(i)*fc(i) < 0
      a(i) = a(i-1);
      b(i) = c(i-1);
    else
      a(i) = c(i-1);
      b(i) = b(i-1);
    endif
    if abs(fc(i))<0.0001
      break;
    endif
  endfor
  retval = [a' b' fa' fb' c' fc'];
  
endfunction
