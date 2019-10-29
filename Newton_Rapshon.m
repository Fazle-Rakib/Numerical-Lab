## Author: Fazle Rakib <2017831030>
## Created: 2019-10-29

function retval = Newton_Rapshon (f,fd,a,b)
   fa = f(a);
   fb = f(b);
   if((fa*fb)>0)
      retval = 'Real Root does not exits';
      return;
    end
    ara(1) = (a+b)/2;
    for i = 2:50
      ara(i) = ara(i-1)-(f(ara(i-1))/fd(ara(i-1)));
      %fprintf('%d\n',i);
      if ara(i) == ara(i-1)
        break;
      end
    endfor
    retval=[ara'];
endfunction
