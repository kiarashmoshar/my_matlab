function a=myfun(a)
clc; 
clear all; 
close all; 
inputvideo=vision.VideoFileReader('traffic.avi');
display('video is imported!');
vid1=vision.VideoPlayer; 
while~isDone(inputvideo)
frame1=step(inputvideo); 
    step(vid1,frame1); 
    pause(0.005); 
end 
imwrite(frame1,'C:\Users\kiarash7\Desktop\kiarash1\referenceimage.jpg','jpg'); 
display('The image write in Desktop');
release(inputvideo); 
release(vid1); 
referenceimage=imread('C:\Users\kiarash7\Desktop\kiarash1\referenceimage.jpg'); 
display('The image in desktop was read');
vid2=vision.VideoFileReader('Traffic.avi'); 
for i=2:121 
    clc 
    frame=step(vid2); 
    frame2=((im2double(frame))-(im2double(referenceimage))); 
    frame1=im2bw(frame2,0.2); 
    [labelimage]=bwlabel(frame1); 
    stats=regionprops(labelimage,'basic'); 
     BB=stats.BoundingBox 
      X(i)=BB(1) 
      Y(i)=BB(2) 
      Dist=((X(i)-X(i-1))^2+(Y(i)-Y(i-1))^2)^(1/2)
      Z(i)=Dist; 
      if(Dist>10&&Dist<20) 
          display('MEDIUM SPEED'); 
      elseif(Dist<10) 
          display('SLOW SPEED'); 
      else 
          display('FAST SPEED'); 
      end 
      M=median(Z); 
Speed=(M)*(120/8)
    S=strel('disk',6); 
    frame3=imclose(frame1,S);     
    step(vid1,frame1); 
    pause(0.05); 
end 
M=median(Z); 
Speed=(M)*(120/8)

release(vid1)
