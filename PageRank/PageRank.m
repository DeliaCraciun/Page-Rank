function [R1 R2] = PageRank(nume, d, eps)
  f = fopen(nume,"r");
  output_file = [nume ".out"];
  out = fopen(output_file, "w");
  N = fgetl(f);
  N = str2num(N);
  R1 = zeros(N,1);
  R2 = zeros(N,1);
  PR1 = zeros(N,1);
  R1 = Iterative(nume, d, eps);
  R2 = Algebraic(nume, d);
  cont = 0;
 #citesc linie cu linie pana ajung la valori 
 #facem vectorul cu indici
  NODURI = zeros(N,1);
  while(cont != N)
   junk = fgetl(f);
   cont++;
   NODURI(cont) = cont;
  endwhile 
  val1=0;
  val1 = fscanf(f,"%lf",1);
  val2=0;
  val2 = fscanf(f,"%lf", 1);
  fclose(f);
  PR1 = R2;

  #ordine descrescatoare + schimb si indicii din NODURI
  for i = 1:N
    for j  = 1:N - i
      if(PR1(j) < PR1(j+1))
      aux = PR1(j);
      PR1(j) = PR1(j+1);
      PR1(j+1) = aux;
      aux =  NODURI(j);
      NODURI(j) = NODURI(j+1);
      NODURI(j+1) = aux;
      endif
    endfor
  endfor
  #afisare
  fprintf(out,"%d\n",N); 
  for i = 1:N
    fprintf(out,"%0.6f\n",R1(i));
  endfor
  fprintf(out,"\n");
  for i = 1:N
    fprintf(out,"%0.6f\n",R2(i));
  endfor
   fprintf(out,"\n");
  for i = 1:N
    u = Apartenenta(PR1(i), val1, val2);
    fprintf(out,"%d %d %0.6f\n",i, NODURI(i), u);
  endfor
  fclose(out);
  #fdisp(out,R1);
  
  endfunction