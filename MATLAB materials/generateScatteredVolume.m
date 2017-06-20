function [ vol1, X, I ] = generateScatteredVolume( siz,X,I,rho,A,B,g)
% GENERATESCATTEREDVOLUME creates a siz(1) * siz(2) * siz(3) sized volume containing
% scattered data with scattering density of rho. 
% Scattering intensity is gamma distributed with parameter A,B and
% scaled by factor g
% INPUT:
% siz(3): a 1x3 vector, containing the X-Y-Z-size of the volume
% X: Set of points where the scattering particles are located,
% if X = [] new particle locations are initialized
% I: Intensity of the scattering particles, 
% If I =[] new particles intensities are initilized
% rho: scattering density in particles/cm^3: currently each volume is
% assume to be 1cm^3, hence rho is effectively just the number of particles
% TODO add another size argument giving the dimension in cm
% A,B parameter random intensity gamma distribution 
% g scaling for the gray values
% OUTPUT
% vol: output volume containing the scattered data
% X: containing the pixel locations of scattering particles 
% I: containing the intensity values of the particles


% TODO add this size argument as an input to allow custom sized volumes
% e.g. volume size is 1cm^3 
sX = 1; % size in cm
sY = 1;
sZ = 1;
% initilialize the empty volume
vol1 = zeros(siz(1),siz(2),siz(3));

% if no particles are given as input, create a new random set of particle
% coordinates, else just get the number of input particles.
if (isempty(X))
    N = sX*sY*sZ*rho; % Number of particles to spread in the volume
    X = zeros(N,3); % position of the particles in X,Y,Z convetion
    for iP = 1:N
        X(iP,:) = [randi(size(vol1,1)) ,randi(size(vol1,2)), randi(size(vol1,3)) ];  % generate 3 random coordinates values x,y,z
    end
else   
     N = size(X,1);
end



% if no particles are given as input, generate a random intensity for each particle (particles with not reflect all equally, but with random intensities)
% typical for tissue is gamma distributed intensity
if(isempty(I))
    I = g*gamrnd(A,B,N,1);
end

% now disperse the particles in the volume
for iP =1:size(X,1)
    vol1(X(iP,1),X(iP,2),X(iP,3)) = I(iP);
end

% apply gaussian blur to mimmic the point spread function of an imaging
% device.
vol1 = imgaussfilt3(vol1,1.2);

end

