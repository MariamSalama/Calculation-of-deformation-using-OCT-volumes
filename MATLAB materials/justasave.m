function New_volume = displacement(vol1 ,center, radius, factor)

New_volume = vol1;

% Displacement in X-axis
volXsize = size(vol1,1);
FacX = (radius(1) / volXsize)*10;
dispX = zeros(radius(1),1);

for i = 1:radius(1)
    dispX(i) = round(FacX * factor/i);
    New_volume(
end

% Displacement in Y-axis
volYsize = size(vol1,2);
FacY = (radius(2) / volYsize)*10;
dispY = zeros(radius(2),1);

for i = 1:radius(2)
    dispY(i) = round(FacY * factor/i);
end

% Displacement in Z-axis
volZsize = size(vol1,3);
FacY = (radius(3) / volZsize)*10;
dispY = zeros(radius(3),1);

for i = 1:radius(3)
    dispY(i) = round(FacY * factor/i);
end

% c_x c_y c_z are only counters

for c_z = 1:radius(3)
    for c_y = 1:radius(2)
        for c_x 1:radius(1)
            New_volume(center(1)+dispX(c_x),center(2),center(3)) = ...
                New_volume(center(1),center(2),center(3));
            New_volume(center(1),center(2),center(3)) = 0;
            
            New_volume(center(1)-dispX(c_x),center(2),center(3)) = ...
                New_volume(center(1),center(2),center(3));
            New_volume(center(1),center(2),center(3)) = 0;
        end

end


