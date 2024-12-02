% This tests if the car can deliver in 2 zones that are not adjacent.
border(a,b;c,d).

parcelType(1,1).

weightLimit(200).
volumeLimit(1000).

cars(2).

parcel(1,a,1,1).
parcel(2,c,1,1).

% Answer should be:
% Needs 2 cars one with each parcel since one car can't deliver in 2 locations that do not share a commom border.
