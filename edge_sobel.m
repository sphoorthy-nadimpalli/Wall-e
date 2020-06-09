function [outs,Ga]=edge_sobel(I)
%I=imread('B:\my files\image_processing\images_er\Img000000.tif');
%figure(1)
%imshow(I);


a=gaussBlur(I);

%Sobel kernels
kernel=3;
Sy=[1,2,1;0,0,0;-1,-2,-1];
Sx=-1*Sy.';

%convolution
a1=im2double(a);
for p=1:length(a(:,1))-(kernel-1)
  for q=1:length(a(1,:))-(kernel-1)

        for i=1:kernel
           for j=1:kernel
              Gx(i,j)=Sx(i,j)*a1(p+i-1,q+j-1);
              Gy(i,j)=Sy(i,j)*a1(p+i-1,q+j-1);
             
           end
        end
        %output value
        
        out(p,q)=abs(sum(sum(Gx)))+abs(sum(sum(Gy)));
        Ga(p,q)=atan(sum(sum(Gx))/sum(sum(Gy)));
   end
end
   
%output image
  
  outs=im2uint8(out);
  %figure(2)
  %imshow(outs);
  
end
  





