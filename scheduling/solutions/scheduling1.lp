1{assign(X,Y,Z) : days(Z,Y)}1 :- courseYear(X,_), days(_,Y). %assign(course,examType,day)

:- assign(X1,_,Z1), assign(X2,_,Z2), X1 != X2, Z1 = Z2, overlap(X1,X2,_).

%:- assign(X1,_,Z1), assign(X2,_,Z2), courseYear(X1, W1), courseYear(X2, W2), X1 != X2, W1 = W2, Z1 + 1 = Z2.

%:- assign(X1, Y1, Z1), pref(X2, Y2, Z2, Z3), X1 = X2, Y1 = Y2, Z2 > Z1.
%:- assign(X1, Y1, Z1), pref(X2, Y2, Z2, Z3), X1 = X2, Y1 = Y2, Z1 > Z3.

consecutiveTests(X1,Z1,X2,Z2,W1,W2) :- assign(X1,_,Z1), assign(X2,_,Z2), courseYear(X1, W1), courseYear(X2, W2), X1 != X2, W1 = W2, Z1 + 1 = Z2.

#minimize{1@2, X1,Z1,X2,Z2,W1,W2 : consecutiveTests(X1,Z1,X2,Z2,W1,W2)}.

valuesPref(X1, Y1, Z1) :- assign(X1, Y1, Z1), pref(X2, Y2, Z2, Z3), X1 = X2, Y1 = Y2, Z2 <= Z1, Z1 <= Z3.

#maximize { 1@1, X, Y, Z : valuesPref(X, Y, Z) }.

%#show aux1/5.
#show assign/3.