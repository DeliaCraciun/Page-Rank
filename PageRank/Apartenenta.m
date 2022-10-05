function u = Apartenenta(x, val1, val2)
#a*val1 + b = 0 =>b = -a/val1        |  rezulta din cele 2
#a*val2 + b = 1 = > b = 1 - a * val2 |
#-a/val1 = 1 - a * val2 => a(val2 - val1) = 1 =>
# => a = 1/(val2 -val1)
#=> b = -val1/(val2 - val1)
  if( x >=0 && x <= 1) 
  if(x >= 0 && x < val1)
    u = 0;
   endif
   if(x >= val1 && x <= val2)
    u = (1/(val2 -val1) )*x + (-val1/(val2 - val1) );
   endif
   if(x > val2 && x <=1)
    u = 1;
   endif
   endif
  endfunction 