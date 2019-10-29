## Author: Fazle Rakib <2017831030>
## Created: 2019-10-28

function retval = FalsePosition (f,a,b)
  fa(1) = f(a(1));
  fb(1) = f(b(1));
  c(1) = (a(1)*fb(1)-b(1)*fa(1))/(fb(1)-fa(1));
  fc(1) = f(c(1));
  
  for i = 2:50
    if fa(i-1)*fc(i-1) < 0
      a(i) = a(i-1);
      b(i) = c(i-1);
    else
      a(i) = c(i-1);
      b(i) = b(i-1);
    endif
    fa(i) = f(a(i));
    fb(i) = f(b(i));
    c(i) = (a(i)*fb(i)-b(i)*fa(i))/(fb(i)-fa(i));
    fc(i) = f(c(i));
    #disp(sprintf('%0.6f  %0.6f  %0.6f  %0.6f  %0.6f  %0.6f',a, b, fa, fb, c, fc));
    
    if abs(fc(i))<0.0001
      break;
    endif
  endfor
  retval = [a' b' fa' fb' c' fc'];
endfunction
