% This tests if the car can't carry more weight than the limit
border(a,b).

parcelType(1,800;2,400).

weightLimit(200).
volumeLimit(5000).

cars(2).

parcel(1,a,1,100).
parcel(2,a,1,100).
parcel(3,a,1,100).

% Answer should be:
% Needs 2 cars, one to transport 2 of the parcels and another to transport the last one.
