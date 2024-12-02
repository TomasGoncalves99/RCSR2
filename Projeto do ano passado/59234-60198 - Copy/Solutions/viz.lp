node((car, ID_CAR)) :- car(ID_CAR).
attr(node, (car, ID_CAR), style, filled) :- car(ID_CAR).
attr(node,(car, ID_CAR),label,
    @concat("🚗:",ID_CAR, " | 💪🏻:", TW, "kg", " | 🔍:", TV, "dm³")) 
    :- car(ID_CAR),
    TW = #sum { W,ID_PARCEL : assign(ID_PARCEL,ID_CAR), 
    parcel(ID_PARCEL,_,_,W) }, 
    TV = #sum { V,ID_PARCEL : assign(ID_PARCEL,ID_CAR), 
    parcel(ID_PARCEL,_,T,_), parcelType(T,V) } .

node((parcel, ID_PARCEL)) :- parcel(ID_PARCEL,_,_,_).
attr(node,(parcel, ID_PARCEL),label,
    @concat("📦_",ID_PARCEL," to ", TO_Z)) 
    :- parcel(ID_PARCEL,TO_Z,_,_).

node((border, Z1, Z2)) :- border(Z1,Z2).
attr(node,(border, Z1, Z2),label,
    @concat("📍(",Z1,"-",Z2,")")) 
    :- border(Z1,Z2).


% Parcels --> Cars
edge(((parcel, ID_PARCEL) , (car, ID_CAR))) 
    :- assign(ID_PARCEL, ID_CAR), parcel(ID_PARCEL,_,_,_).

% Cars --> Zones
edge(((car, ID_CAR) , (border, Z1, Z2))) 
    :- deliversInBorder(ID_CAR, Z1, Z2).

% Graph label of limits
attr(graph, default, label, 
    @concat("MAX💪🏻:", MW, "kg", " | MAX🔍:",MV, "dm³")) 
    :- weightLimit(MW), volumeLimit(MV).

