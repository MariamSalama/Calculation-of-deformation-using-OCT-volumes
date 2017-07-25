clear all
close all
% create a scatter volume
siz = [512,512,192];
rho = 2*10^4; % scattering density
A = 1; % parameter for gamma distribution
B = 2; % parameter for gamma distribution
g = 50; % scaling for the intensity values

% initially no particles are given, hence X and I are [] 
[vol00, X, I] = generateScatteredVolume(siz,[],[],rho,A,B,g);

% slice through the volume
% for i =1:size(vol1,3)
%     imagesc(vol1(:,:,i))
%     drawnow
% end

% transform the set of points X to a new location and call the function
% generateScatteredVolume again, but now with new particle locations X and intensities I as
% input
radius = 80;
center = [250 250 90];
max_disp = 3;
vol01 = displacement(vol00,center,radius,max_disp);

% slice through the volume
for i =1:size(vol01,3)
    imagesc(vol01(:,:,i))
    drawnow
    pause
end

vol = cell(1);
vol{1,1} = vol00;
vol1 = cell(1);
vol1{1,1} = vol01;
% z=46;
% image(vol1(:,:,z))
% figure
% image(displaced_vol(:,:,z))
% figure
