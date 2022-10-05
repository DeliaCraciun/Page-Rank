	Tema 1 MN - PAGE RANK
Timp de implementare -> aproximativ 10 ore

	Cerinta 1
*Citirea
-Citim numarul de noduri din fisier, dupa care citim linie cu linie, parasndu-le.
Astfel, retinem cate legaturi are nodul de pe linia la care ma aflu si parcurgem 
linia din acel punct(adica de la pozitia 2 a vectorului), pana la final pentru a
ne realiza matricea de adiacenta.In acelasi timp verificam daca indicii matricei
sunt la fel, iar in acest caz facem acel element 0(pentru a avea doar 0 pe diagonala
principala).Citim ultimele 2 valori din fisier.

*Creearea vectorului cu numarul de legaturi ale fiecarui nod si initializare PR
-Parcurgem matricea de adiacenta si cu un contor verificam cate valori de 1 se afla pe
fiecare linie, urmand sa completam in vectorul L acest numar.In acelasi timp ne initializam
vectorul de PageRank care va avea pe fiecare linie fractia : 1/(total numar noduri).

*Creearea matricei M din algoritm
-Initializam matricea M cu 0.Parcurgem matricea de adiacenta coloana cu coloana si in momentul 
in care gasim valoarea 1,punem in matricea M cu indicii neinversati valorea fractiei 1/(cate legaturi
are nodul corespunzator liniei j din L).

*Rezultat final
-Initializam un nou vector pentru PageRank, folosindu-ne de formula matriceala din algoritm.
Apoi, cat timp eroare dintre vectorul nou pentru PageRank si cel vechi este mai mare decat cea 
dorita, vectorul nou de PageRank se actualizeaza cu formula matriceala.In momentul in care eroare
devine mai mica decat eps-ul dat, avem raspunsul final. 

	Cerinta 2
-Se efectueaza aceleasi operatii, mai putin *Rezultatul final.Se rescrie formula care e sub forma
matriceala astfel incat sa se utilizeze inversa matricei ce trebuie aflate.Se trimite aceasta ca 
parametru pentru functia PR_Inv.m unde se va face descompunerea Q*R cu ajutorul algoritumului
Gram-Schmidt modificat.Se inmulteste ecuatia A=QR cu A^-1 la stanga si se obtine o noua ecuatie
In=QRA^-1.Se inmulteste la stanga cu Q^-1 (matricee care fiind ortogonala are proprietatea ca
inversa lui Q e transpusa acesteia) si rezulta Qt = R*A^-1.Cu ajutorul functiei linsolve se rezolva
sistemul superior triunghiular( sistemul e SST datorita R).

	Cerinta 3
*Citire
-Citesc numarul de noduri, dupa care imi fac cei doi vectori de PageRank pentru functiile
Iterative.m si Algebraic.m.Citesc apoi linii cate sunt si noduri pentru a ajunge la val1 si
val2 care ma intereseaza pentru aceasta functie in mod special.Cand citesc liniile imi si creez
un vector care are nodurile in ordine crescatoare asa cum sunt primite in fisier.Apoi sortez 
descrescator in functie de valorile din vectorul rezultat din Algebraic.m atat pe acesta,cat
si vectorul cu noduri pentru a retine legaturile dintre valoare si nod.

*Functia de apartenenta
-Am calculat valorile pentru val1 si val2 cu ajutorul relatiilor :a*val1 + b = 0 si a*val2 + b = 1
pentru ca functia sa fie continua.Apoi in functie de intrvalul in care ma aflu functia mea capata
valorile specificate in tema si este returnata.

*Afisare
-Intai se afiseaza numarul de noduri.Apoi valorile PageRank dupa Iterative.m, api valorile PageRank
dupa functia Algebraic.m.
-Dupa care pentru fiecare valoarea din vectorul rezultat din Algebraic.m verific aparteneta
si vad cat este functia pentru valoarea respectiva din vector, afisand pe rand numarul linie,
indicele nodului si mai apoi valorea functiei.