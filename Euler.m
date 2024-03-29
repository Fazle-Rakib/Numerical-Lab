## Author: Fazle Rakib <2017831030>
## Created: 2019-10-29

function retval = Euler (f, xrange,y0,h)
  x = xrange(1):h:xrange(2);
  y(1) = y0;
  for i = 2:length(x)
    y(i) = y(i-1)+h*f(x(i-1),y(i-1));
  endfor
  retval = [x' y'];
endfunction
