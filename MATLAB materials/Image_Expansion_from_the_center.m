% toys = imread('toys.jpg');
% r = @(x) sqrt(x(:,1).^2 + x(:,2).^2);
% w = @(x) atan2(x(:,2), x(:,1));
% f = @(x) [r(x).^2 .* cos(w(x)), r(x).^2 .* sin(w(x))];
% g = @(x, unused) f(x);
% tform3 = maketform('custom', 2, 2, [], g, []);
% toys3 = imtransform(toys, tform3, 'UData', [-1 1], 'VData', [-1 1], ...
%     'XData', [-1 1], 'YData', [-1 1]);
% imshow(toys3)

toys = imread('toys.jpg');

% x_buckling = 1;   %very very useful
% y_buckling = 1;   %very very useful
% r = @(x) sqrt(x(:,1).^2 + x(:,2).^2);
% w = @(x) atan2(x(:,2), x(:,1));
% f = @(x) [r(x).^x_buckling .* cos(w(x)), r(x).^y_buckling .* sin(w(x))];
% g = @(x, unused) f(x);
% tform3 = maketform('custom', 2, 2, [], g, []);
% toys3 = imtransform(toys, tform3, 'UData', [-1 1], 'VData', [-1 1], ...
%     'XData', [-1 1], 'YData', [-1 1]);
% imshow(toys3)

x_y_buckling = 1;   %very very useful
r = @(x) sqrt(x(:,1).^2 + x(:,2).^2);
w = @(x) atan2(x(:,2), x(:,1));
f = @(x) [r(x).^x_y_buckling .* cos(w(x)), r(x).^x_y_buckling .* sin(w(x))];
g = @(x, unused) f(x);
tform3 = maketform('custom', 2, 2, [], g, []);
toys3 = imtransform(toys, tform3, 'UData', [-1 1], 'VData', [-1 1], ...
    'XData', [-1 1], 'YData', [-1 1]);
imshow(toys3)