tic 
% Initiates timer.
x = imread('C:\Users\kiarash7\Desktop\testimage.jpg');    % Image named ‘testimage.jpg’ is read and saved in ‘x’.
x = rgb2gray(x); 
% ‘rgb2gray’ converts true color image into gray level
% based intensity image.
[w,h]=size(x);                
% Record the dimensions of image ‘x’ in [w,h].
for i=1:1:w 
% This ‘for’ loop thresholds the image and convert it to a 
for j=1:1:h                    
% binary image (White = 255 and Black =0).
if(x(i,j)>100)
x(i,j)=0;
else
x(i,j)=255;
end
end
End
[L,num]=bwlabeln(x,8);   
% Returns an object ‘L’ of the same size as ‘x’ with labeled 
% connected objects.
for i=1:1:num   
% This ‘for’ loop labels the largest object.
a(i)=length(find(L==i))
end;
b=max(a);
maxlabel=0;
for i=1:1:num
if (a(i)==b)
maxlabel=i;
end
End
[c,d]=find(L~=maxlabel); 
%  This ‘for’ loop is used for making all of the  for 
i=1:1:length     
s=c(i);   
%  a part of the background.
g=d(i);
x(s,g)=1;
End
subplot(3,1,3)
imshow(x) 
% Pops up the image ‘x’.
centerx=w/2     
% Calculates the  x component of the center of the image. 
centery=h/2      
% Calculates the y component of the center of the image.
a=zeros(h,1);    
% This set of statements is used to calculate horizontal and 
b=zeros(w,1);   
% vertical projection of the target object. 
for row=1:1:w
for col=1:1:h
if (x(row,col)>50)
a(row)=a(row)+1;
end
end
End
for col=1:1:h
for row=1:1:w
if (x(row,col)>50)
b(col)=b(col)+1;
end
end
End
area=0; 
% Calculated the area of the target object. 
for i=1:1:h
area=area+a(i);
End
ibar=0;  
% This set of statements calculate the centroid of the target 
for i=1:1:h 
%  object using projections and area calculated earlier. 
ibar=ibar+i*a(i);
End
ibar=ibar/area
jbar=0;
for i=1:1:w
jbar=jbar+i*b(i);
End
jbar=jbar/area
59
dev=abs(centery)-jbar
toc 
% Stops the timer initiated earlier.
t=toc
t; 
% Gives the total time taken for the processing of test 
%  image using  this