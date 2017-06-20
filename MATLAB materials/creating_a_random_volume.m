a= randi(256,128,128,64);
for i=1:64

imagesc(a(:,:,i))
drawnow
pause
end