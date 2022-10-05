function B = PR_Inv(A)
N = size(A,1); 
#facem Gram-Schmidt
   for i = 1:N
   R(i,i) = norm(A(:,i));
   Q(:,i) = ( A(:,i)/R(i,i) );
   for j = i+1:N
     R(i,j) = Q(:,i)' * A(:,j);
     A(:,j) = A(:,j) - Q(:,i)*R(i,j);
   endfor
 endfor
#B ->invrsa matricei A
#In=QRB^-1 => Qt = RB^-1 => B^-1 = Qt/R
#rezolvam sistemul superior triunghiular
B = linsolve(R,Q');
  endfunction