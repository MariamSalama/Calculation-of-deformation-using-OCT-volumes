% creating a random volume with the values from 0 to 256

a= randi(256,512,512,192);
% for i=1:192
% 
% imagesc(a(:,:,i))
% drawnow
% pause
% end


% Applying deformation on that volume 

j = 0;
sliced_image_rescaled = zeros(512,512,192);
x_y_buckling=1;
for j=1:192

sliced_image = a(:,:,j);

%----------- tform-----------------------------------------------
if (j<=96)
    x_y_buckling = x_y_buckling + 0.003 
end  
if (j>96)
    x_y_buckling = x_y_buckling - 0.003 
end    

r = @(x) sqrt(x(:,1).^2 + x(:,2).^2);
w = @(x) atan2(x(:,2), x(:,1));
f = @(x) [r(x).^x_y_buckling .* cos(w(x)), r(x).^x_y_buckling .* sin(w(x))];
g = @(x, unused) f(x);
tform3 = maketform('custom', 2, 2, [], g, []);

%-------------------applying the transformation -------------------
sliced_image_expanded = imtransform(sliced_image , tform3, 'UData', ...
[-1 1], 'VData', [-1 1],  'XData', [-1 1], 'YData', [-1 1]);

%--------------------Displaying images ------------------------
sliced_image_rescaled(:,:,j)  = imresize(sliced_image_expanded,[512 512]);
imagesc(sliced_image_rescaled(:,:,j));
%drawnow expose
%pause
end

vol00 = cell(1)
vol00{1,1} = a;
vol = cell(1)
vol{1,1} = sliced_image_rescaled;
