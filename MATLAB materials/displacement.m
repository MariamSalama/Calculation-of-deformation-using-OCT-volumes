function New_volume = displacement(vol1 ,center, radius, factor)
% Input: vol1   :  the complete volume 
%        center :  the reference point
%        radius :  the radius of the volume the we want to change
%        factor :  acts like a tunning knop, it's max value = radius




%creating a copy of the oiginal volume so we woud be able to compare
new_volume = vol1;


new_volume_size = min(size(new_volume));
        %The intensity of the displacement is relative to the ratio between
        %the volume we wish to apply diformation to the size of the whole volume
        
Fac = (radius / new_volume_size)*10; 
        %this 10 is not accurate at all and it will cause problems 

       
disp = zeros(radius,1);
        %disp is the array containing the values of the displacements
        %it starts with a maximum then it is supposed to decrease to zero
        
if factor > radius
    factor = radius;
end
    
        
%The displacement will be equal in all direction like a quebe so we have
%only one diplacement array
for i = 1:radius
    disp(i) = round(Fac * factor/i)
end


for c_z = -radius:radius      % c_x c_y c_z are only counters
    for c_y = -radius:radius
        for c_x = -radius:radius
            the_counters = [c_x c_y c_z];
            P = max( abs(the_counters) );
            if P == 0
                P = P+1;
            end
                if (c_x > 0) && (c_y > 0) && (c_z > 0)
                new_volume((center(1)+c_x+disp(P)),(center(2)+c_y+disp(P)),(center(3)+c_z+disp(P))) = ...
                new_volume((center(1)+c_x),(center(2)+c_y),(center(3)+c_z));
                end
                 if (c_x < 0) && (c_y > 0) && (c_z > 0)
                new_volume((center(1)+c_x-disp(P)),(center(2)+c_y+disp(P)),(center(3)+c_z+disp(P))) = ...
                new_volume((center(1)+c_x),(center(2)+c_y),(center(3)+c_z));
                 end
                 
                if (c_x > 0) && (c_y < 0) && (c_z > 0)
                new_volume((center(1)+c_x+disp(P)),(center(2)+c_y-disp(P)),(center(3)+c_z+disp(P))) = ...
                new_volume((center(1)+c_x),(center(2)+c_y),(center(3)+c_z));
                end
                if (c_x < 0) && (c_y < 0) && (c_z > 0)
                new_volume((center(1)+c_x-disp(P)),(center(2)+c_y-disp(P)),(center(3)+c_z+disp(P))) = ...
                new_volume((center(1)+c_x),(center(2)+c_y),(center(3)+c_z));
                end
                
                if (c_x > 0) && (c_y > 0) && (c_z < 0)
                new_volume((center(1)+c_x+disp(P)),(center(2)+c_y+disp(P)),(center(3)+c_z-disp(P))) = ...
                new_volume((center(1)+c_x),(center(2)+c_y),(center(3)+c_z));
                end
                if (c_x < 0) && (c_y > 0) && (c_z < 0)
                new_volume((center(1)+c_x-disp(P)),(center(2)+c_y+disp(P)),(center(3)+c_z-disp(P))) = ...
                new_volume((center(1)+c_x),(center(2)+c_y),(center(3)+c_z));
                end
                
                if (c_x > 0) && (c_y < 0) && (c_z < 0)
                new_volume((center(1)+c_x+disp(P)),(center(2)+c_y-disp(P)),(center(3)+c_z-disp(P))) = ...
                new_volume((center(1)+c_x),(center(2)+c_y),(center(3)+c_z));
                end
                if (c_x < 0) && (c_y < 0) && (c_z < 0)
                new_volume((center(1)+c_x-disp(P)),(center(2)+c_y-disp(P)),(center(3)+c_z-disp(P))) = ...
                new_volume((center(1)+c_x),(center(2)+c_y),(center(3)+c_z));
                end
                %I started from the center which is the reference point,
                %then to access every element in the specified volume to be
                %changed,i used 3 for loops that counts within the size of
                %the specified volume  
                %Then to apply displacement i used "disp(p)", where p is the 
                % largest number of the three counters to assure that the
                % diformation is spherical., so near the center we will
                % have maximum displacement in all directions and as we
                % move away from the center the deformation decreases till
                % it's zero.
                %also to avoid overwriting what was already changed and to
                %reduce run time if the  is pointing at an element which
                %has the value of zero, then we should not change anything.
        end
    end
end
New_volume = new_volume;
end


