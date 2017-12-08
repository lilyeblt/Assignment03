% TJ Lilyeblade
% CEC 495A
% 9/18/2017

% Track juggling balls

% NOTE FOR LATER
% b(1) = d(mi(1))
% for loop will work

clear all;
close all;
clc;

startFrame = 1;
endFrame = 936;

 for k = startFrame : endFrame
     rgb = imread(['juggle/img',sprintf('%2.3d',k),'.jpg']);
    [BW, masked] = createMask(rgb);
    
    SE = strel('disk',10,0);
    Iclose = imclose(BW, SE);
    BW2 = imfill(Iclose,'holes');
    
    [labels, number] = bwlabel(BW2,8);
       
     if number > 2
        
%         Get basic stats
        Istat = regionprops(BW2,'all');

        centroids = cat(1, Istat.Centroid);
        boxes = cat(1, Istat.BoundingBox);
        
        imshow(rgb)
        hold on
        
        rectangle('Position',[Istat.BoundingBox]);
        
        scatter(centroids(:,1),centroids(:,2));
        hold off
        pause;
        
     end
 end

% for b = 1:1:3
%     for d = 1:1:3
%         dist(b,d) = hypot(abs( ),abs( ))
%     end
% end
