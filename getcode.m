function [ final ] = getcode( new,source )
%This Function gets the inputs (new= the image 2 loaded which has the code,
%source=the original image loaded to compare

%The folowing lines is to get the indecies of embedded code in the image
%By determine the indecies of different elements in(new)  from the original(source)
%then get the unrepeated rows and (columns matrices m and n) so the code positions can be estimated
[ro,co]=find(new~=source); 
 
 m=unique(ro);
 n=unique(co);
 
%n contain all column from page 1 and 2 (no of col in p 1=no of col in p 2)
%so h=no of columns of embedded code will be in (matrix)
h=length(n)/2; 
matrix=zeros(length(m),h);

 for i=1:length(m)
         for j=1:h
            %the following lines estimate the metod of embed the code
            %(whether by addition or subtraction) from comparing if
            %statements
            
            if new(m(i),n(j))<=source(m(i),n(j))
                change1=source(m(i),n(j))-new(m(i),n(j));
            else
                change1=new(m(i),n(j))-source(m(i),n(j));
            end
            
            %n(j+h) get the position of the matching element in page 2=(m(i),n(j+h),2)
            if new(m(i),n(j+h))<=source(m(i),n(j+h))
                change2=source(m(i),n(j+h))-new(m(i),n(j+h));
            else
                change2=new(m(i),n(j+h))-source(m(i),n(j+h));
            end
         %convert the code element to double type to manage multiplying by 1000 and addition  
         
         change1=double(change1);
         change2=double(change2);
         matrix(i,j)=change1;
         matrix(i,j)=1000*matrix(i,j)+change2;
         end
         
     
 end

 
 final=matrix;



end

