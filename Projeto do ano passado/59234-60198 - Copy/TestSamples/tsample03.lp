% This tests if the car can delivery in 2 zones
border(a,b).

parcelType(1,1).

weightLimit(200).
volumeLimit(1000).

cars(1).

parcel(1,a,1,1).
parcel(2,b,1,1).

% Answer should be:
% SATISFIABLE since 1 car can deliver in a and b.
