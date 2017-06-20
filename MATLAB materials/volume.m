i = 1;
for i=1:30
file = ['E:\2TUHH\4th_semester\Projektarbeit\octvolumes\octvolume_' num2str(i) '.bin'];
fid = fopen(file);
data = fread(fid,'float32');
fclose(fid)
%%
vol = reshape(data,512,256,256); % ZXY
%%
volumesorted = sort(vol);
for iZ = 1:256
 slice = squeeze(vol(:,:,iZ));
 image(slice);
 colormap gray
 drawnow
 pause
end
mip = squeeze(mean(volumesorted(1:10,:,:),1));
imagesc(mip)
colormap gray
drawnow
end



% a= randi(256,128,128,64);
% for i=1:64
% 
% imagesc(a(:,:,i))
% drawnow
% pause
% end

