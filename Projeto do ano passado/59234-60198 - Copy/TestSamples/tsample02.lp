% This tests if the car can't carry more volume than the limit
border(a,b).

parcelType(1,800;2,400).

weightLimit(200).
volumeLimit(1000).

cars(3).

parcel(1,a,1,1).
parcel(2,a,1,1).
parcel(3,a,1,1).

% Answer should be:
% Needs 3 cars, one to transport each of the parcels.
