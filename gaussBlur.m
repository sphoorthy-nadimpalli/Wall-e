
function outg=gaussBlur(a)
%%convoultion of gaussian filter and image gives the gaussian blur
%a=imread('B:\my files\image_processing\images_er\Img000001.tif');
%filter kernel
kernel=5;

%standard deviation
s=1.7;
z=0;

%gaussian filter function
 for    x=-(kernel-1)/2:1:(kernel-1)/2
     for  y=-(kernel-1)/2:1:(kernel-1)/2
            pow=((x.^2)+(y.^2))/(2*(s.^2));
            den=1/(s*sqrt(2*pi));
            gf(x+(kernel+1)/2,y+(kernel+1)/2)=(den*exp(-pow));
     end
 end
 sm=sum(sum(gf));
 
 %normalization:changing intensity 
 f=gf/sm; 
 a1=im2double(a);
 

 %convolution
 for x=1:length(a(:,1))-(kernel-1)
  for y=1:length(a(1,:))-(kernel-1)

        for i=1:kernel
           for j=1:kernel
              z(i,j) =f(i,j).*a1(x+i-1,y+j-1);
           end
        end
        %output value
        out(x,y)=sum(sum((z)));
   end
  end
  %output image 
  outg=im2uint8(out);
  %figure(1)
 % imshow(outg);
end