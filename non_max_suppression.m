
%for the pixel between the specified angle if the pixel with highest intensity in the
%direction is choosed for thinning the edges
function Q=non_max_suppression(I)

%S is the image angle is the gradient outs and Ga in edge sobel 
%I=imread('B:\my files\image_processing\images_er\Img000001.tif');

[S,angle]=edge_sobel(I);
a1=rad2deg(angle);
Q=uint8(0);
figure(2)
imshow(S)


for i=1:length(a1(:,1))
    for j=1:length(a1(1,:))
        a=a1(i,j);
        
       
        if -22.5<=a&&a<22.5
            a=0;

        elseif 22.5<=a&&a<67.5
            a=45;
        elseif 112.5<=a&&a<157.5
            a=135;
        elseif 157.5>=a&&a>-157.5
            a=180;
        elseif -157.5<=a&&a<-112.5
            a=-135;
        elseif -112.5<=a&&a<-67.5
            a=-90;
        elseif -67.5<=a&&a<-22.5
            a=-45;
        else
            a=90;
        end
        a1(i,j)=a;
    end
end



for i=2:length(a1(:,1))-1
    for j=2:length(a1(1,:))-1
        if a1(i,j)==0||180
            if S(i,j)>=S(i,j-1)&&S(i,j)>=S(i,j+1)
                Q(i-1,j-1)=S(i,j);
            else
                Q(i-1,j-1)=0;
            
            end
        
        elseif a1(i,j)==90
            if S(i,j)>=S(i-1,j)&&S(i,j)>=S(i+1,j)
                Q(i-1,j-1)=S(i,j);
            else
                Q(i-1,j-1)=0;
            end
        
        elseif a1(i,j)==45
            if S(i,j)>=S(i-1,j-1)&&S(i,j)>=S(i+1,j+1)
                Q(i-1,j-1)=S(i,j);
            else
                Q(i-1,j-1)=0;
            
            end
        elseif a1(i,j)==135
            if S(i,j)>=S(i+1,j-1)&&S(i,j)>=S(i-1,j+1)
                Q(i-1,j-1)=S(i,j);
            else
                Q(i-1,j-1)=0;
            end
        end
    end
    
end
    figure(4)
    imshow(Q);
end

