1{assign(X,Y,Z) : days(Z,Y)}1 :- courseYear(X,_), days(_,Y). %assign(course,examType,day)

1{allocate(X,Y,Z) : room(Z,_)}  :- assign(X,Y,_). %allocate(course,examType,room)

:- assign(X1,_,Z1), assign(X2,_,Z2), X1 != X2, Z1 = Z2, overlap(X1,X2,_).

consecutiveTests(X1,Z1,X2,Z2,W1,W2) :- assign(X1,_,Z1), assign(X2,_,Z2), courseYear(X1, W1), courseYear(X2, W2), X1 != X2, W1 = W2, Z1 + 1 = Z2.

#minimize{1@3, X1,Z1,X2,Z2,W1,W2 : consecutiveTests(X1,Z1,X2,Z2,W1,W2)}.

valuesPref(X1, Y1, Z1) :- assign(X1, Y1, Z1), pref(X2, Y2, Z2, Z3), X1 = X2, Y1 = Y2, Z2 <= Z1, Z1 <= Z3.

#maximize { 1@2, X, Y, Z : valuesPref(X, Y, Z) }.

% Garantir que (Soma da capacidade das salas alocadas) >= (Y em enrolled(X,Y))
allocatedCap(X,Y,S) :-  assign(X, Y, _), S = #sum{C, Z : allocate(X,Y,Z), room(Z,C)}.
:- allocatedCap(X1,_,S), enrolled(X2,Q), X1 = X2, S < Q.

% Minimizar número de salas
numRooms(X,Y,R) :- assign(X, Y, _), R = #count{Z : allocate(X,Y,Z)}.
#minimize{R@1, X, Y: numRooms(X,Y,R)}.

#show allocate/3.