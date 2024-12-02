% This tests the car volumeLimit, weightLimit and delivery system.
border(a,b;b,c;a,c).

parcelType(1,500;2,1000).

weightLimit(200).
volumeLimit(1000).

cars(3).

parcel(1,a,1,100).
parcel(2,b,1,99).
parcel(3,b,2,1).     % This parcel could be attached by using weight metric but not by using volume metric
parcel(4,b,1,100).
parcel(5,c,1,99).

% Answer should be:
% Needs 3 cars,
% One with the first 2 parcels, delivering to a and b
% One with the middle parcel, since it has the maximum volume
% One with the last 2 parcels, delivering to c and b
