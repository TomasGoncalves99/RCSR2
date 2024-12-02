% This test checks if the feature 2 from group 2 works correctly
% Feature from file "parcel2g2.lp":
% You may attempt to reduce (in addition to reducing the number of overall used cars) the number
% of zones each of the cars has to deliver to, with the aim to minimize the number of time-consuming
% trips between zones

border(a,b).

parcelType(1,1).

weightLimit(200).
volumeLimit(1000).

cars(3).

parcel(1,a,1,100).
parcel(2,b,1,100).
parcel(3,a,1,100).     
parcel(4,b,1,100).

% Answer should be
% 2 cars, since one can't handle 400 weight
% 1 car with the 2 parcels from zone a (1 and 3)
% 1 car with the 2 parcels from zone b (2 and 4)
% Optimization 2 2