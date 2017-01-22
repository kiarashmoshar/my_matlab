clc; 
clear all; 
close all; 
inputvideo=vision.VideoFileReader('traffic.avi'); 
vid1=vision.VideoPlayer; 
while~isDone(inputvideo)
    frame1=step(inputvideo); 
    step(vid1,frame1); 
    pause(0.005); 
end 
imwrite(frame1,'C:\Users\kiarash7\Desktop\kiarash1\referenceimage.jpg','jpg'); 
release(inputvideo); 
release(vid1); 
referenceimage=imread('C:\Users\kiarash7\Desktop\kiarash1\referenceimage.jpg'); 
vid2=vision.VideoFileReader('Traffic.avi'); 
for i=2:121 
    clc 
    frame=step(vid2); 
    frame2=((im2double(frame))-(im2double(referenceimage))); 
    frame1=im2bw(frame2,0.2); 
    [labelimage]=bwlabel(frame1); 
    stats=regionprops(labelimage,'basic'); 
     BB=stats.BoundingBox; 
     
    
      X(i)=BB(1);
      Y(i)=BB(2);
      Dist=((X(i)-X(i-1))^2+(Y(i)-Y(i-1))^2)^(1/2)
      
      Z(i)=Dist;
      
      if(Dist>10&&Dist<40)
          
          display('MEDIUM SPEED');
          if(Dist>20)
              display('warning distance')
              
              %warningdistancemedium1(z)='warning distance in medium speed';
              %warningdistancemedium2(z)=Dist;
              pause(1);
          end
          
      elseif(Dist<10) 
          display('SLOW SPEED'); 
          if(Dist>20)
              display('warning distance')
             % warningdistanceslow=['warning distance in slow speed',Dist];
              pause(1);
          end
      elseif(Dist>40) 
          display('FAST SPEED'); 
          if(Dist>20)
              display('warning distance')
             % warningdistancefast=['warning distance in fast speed',Dist];
              pause(1);
          end
      end 
      M=median(Z); 
    S=strel('disk',6); 
    frame3=imclose(frame1,S);     
    step(vid1,frame1); 
    pause(0.05); 
end 
M=median(Z); 
Speed=(M)*(120/8) 
release(vid1)