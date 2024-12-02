% This test checks if the new feature 3 from group 2 works correctly
% Feature from file "parcel3g2.lp":
% You may aim to balance (in addition to reducing the number of overall used cars) the number of
% deliveries per car to provide a fairer distribution of workload between the drivers.

border(a,b).

parcelType(1,1).

weightLimit(300).
volumeLimit(1000).

cars(3).

parcel(1,a,1,100).
parcel(2,a,1,100).
parcel(3,a,1,100).     
parcel(4,a,1,100).

% Answer should be
% 2 cars, since one can't handle 400 weight
% 1 car with the 2 parcels
% 1 car with the 2 parcels
% Since otherwise the workload wouldn't be balanced.
% Optimization 2 2