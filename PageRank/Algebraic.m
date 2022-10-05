function R = Algebraic(nume, d)
f = fopen(nume, "r");
#citire
N = fgetl(f); 
N = str2num(N);
#declarare
L = zeros(N,1);
M = zeros(N,N);
one = ones(N,1);
R1 = zeros(N,1);
R2 = zeros(N,1);
Q = zeros(N,N);
R = zeros(N,N);
 output_precision(7);
#matricea de adiacenta cu 0 pe diagonala principala
cont = 1;
while cont != N+1
    ln = fgetl(f);
    ln = str2num(ln);
    y = ln(2);
#    disp(y);
    for i = 1:y
      A(cont,ln(i + 2)) = 1;
      if( cont == (ln(i + 2)) )
        A( cont, ln(i + 2) ) = 0;
        endif
    endfor
    cont++;
endwhile
 #citesc ultimele 2 valori
  val1=0;
  val1 = fscanf(f,"%lf",1);
  val2=0;
  val2 = fscanf(f,"%lf", 1);
 fclose(f);
for i = 1:N
  cont = 0;
  #indicele page rank initial
    R1(i,1) = 1/N;
  for j = 1:N
    if ( A(i,j) == 1)
      cont++;
    endif
  endfor
  #facem vector cu nr de legturi ale nodurilor
  L(i) = cont;
 endfor
 cont = 0;
 for i = 1:N
   for j = 1:N
     if( A(j,i) == 1)
     #facem matricea M din algoritm
      M(i,j) = 1/L(j);
    endif
   endfor
 endfor
 #R - R*d*M = (1-d)/N*one => R(In - d*M) = (1-d)/N*one
 #sistemul devine R=(In -d*M)^-1 * (1-d)/N*one
 B = PR_Inv(eye(N) - d.*M);
 #Gram-Schmidt->B=Q*R
 #In=QRB^-1 => RB^-1 = Gt
 R = B*((1-d)/N)*one;
#fprintf("%0.6f\n", R);
 endfunction