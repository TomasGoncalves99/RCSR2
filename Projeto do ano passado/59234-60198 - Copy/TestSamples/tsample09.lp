% This test checks if any of the features 2 and 3 from group 2 works correctly.

border(a,b).

parcelType(1,1).

weightLimit(400).
volumeLimit(1000).

cars(3).

parcel(1,a,1,100).
parcel(2,a,1,100).
parcel(3,a,1,100).
parcel(4,a,1,100).
parcel(5,a,1,100).
parcel(6,b,1,100).
parcel(7,b,1,100).
parcel(8,b,1,100).
parcel(9,b,1,100).

% Answer should have 3 cars independently of the feature:

% For the feature which reduces the number of total zones delivered (file "parcel2g2.lp"):
% 2 cars for zone A since no car can carry 5 parcels
% 1 car for zone B delivering the 4 parcels

% For the feature which aims to balance the number of delivers per car (file "parcel3g2.lp"):
% 3 cars delivering 3 parcels each
% This balances the delivers per car to 3

