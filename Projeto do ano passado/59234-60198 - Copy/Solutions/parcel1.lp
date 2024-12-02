% This is the optimized version of the program.

% Generators ===============================================================
% Cars =========================================

% Generate lastCar from 1 to N (number of cars available)
1{ lastCar(X) : X = 1..N }1 :- cars(N).

% Generate cars from 1 to lastCar
car(1..N) :- lastCar(N).

% The number of cars used is the same as the lastCar
usedCars(N) :- lastCar(N).

% Zones ========================================

% Assign borders to cars
1{ deliversInBorder(C, Z1, Z2) : border(Z1,Z2) }1 :- car(C).

% Force the borders to be in ascending order
:- deliversInBorder(C1, Z1, Z2), deliversInBorder(C2, Z3, Z4), C1 < C2, Z1 > Z3.

% A car delivers in a zone if it delivers in a border of that zone
delivers(C,Z) :- deliversInBorder(C,Z,_).
delivers(C,Z) :- deliversInBorder(C,_,Z).

% Parcels ======================================

% Assign parcels to cars
1{ assign(P,C) : delivers(C,Z) }1 :- parcel(P,Z,_,_).

% Force the parcels to be in ascending order
:- assign(P1,C1), parcel(P1,Z,_,_), assign(P2,C2), parcel(P2,Z,_,_), P1 < P2, C1 > C2.

% Restrictions =============================================================

% Cars can't exceed the weight limit.
:- car(C), weightLimit(LimitW), #sum { W,P : assign(P,C), parcel(P,_,_,W) } > LimitW.

% Cars can't exceed the volume limit.
:- car(C), volumeLimit(LimitV), #sum { V,P : assign(P,C), parcel(P,_,T,_), parcelType(T,V) } > LimitV.

% Optimization =============================================================

#minimize { C : usedCars(C) }.








