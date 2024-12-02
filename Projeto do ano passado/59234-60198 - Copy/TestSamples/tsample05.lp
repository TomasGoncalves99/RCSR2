% This tests if the car can't delivery in 3 zones that are adjacent.
border(a,b;b,c;a,c).

parcelType(1,1).

weightLimit(200).
volumeLimit(1000).

cars(2).

parcel(1,a,1,1).
parcel(2,b,1,1).
parcel(3,b,1,1).
parcel(4,c,1,1).

% For the base version the answer should be:
% Needs 2 cars one with the first 3 parcels and the other with the last one.
% With more than 2 zones per car:
% Only one car with all parcels.

% With group 2 features:
% For the feature which reduces the number of total zones delivered (file "parcel2g2.lp"):
% One car with 3 parcels and the other with 1.
% For the feature which aims to balance the number of delivers per car (file "parcel3g2.lp"):
% 2 Cars with 2 parcels each.