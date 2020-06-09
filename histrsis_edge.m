function NM=histrsis_edge(I)

%Removes the un-necessary edge lines of sobel edeging 
%for GRAY-SCALE images

%I=imread('B:\my files\image_processing\images_er\Img000001.tif');

%filtered image
M=non_max_suppression(I);

%Array for pixel values
A=zeros(sum(size(M)),0);

b=2; 
a=1;
%assigning pixel values to array

for i=1:length(M(:,1))
    for j=1:length(M(1,:))
        A(a)=M(i,j);
        a=a+1;
    end
end



A=sort(A);

%B(1)=0;
for i=2:length(A)
    if A(i-1)~=A(i)
     B(b)=A(i);
     b=b+1;
    end
end
 
display(B);
Q3=50;%input('threshold value from last');
Q1=20;%input ('threshold value from first');

for i=3:length(M(:,1))-2
   for j=3:length(M(1,:))-2
       var=M(i,j); 
       if Q3>var && var>Q1
           for p=-2:2
               for q=-2:2  
                  if  M(p+i,q+j)<Q3
                   M(i,j)=0;
                  end
                
               end
           end
       elseif var<Q3
         M(i,j)=0;  
         
       end
   
   end     
end
NM=M(3:length(M(:,1))-2,:);
 figure(4)
imshow(NM);
end     