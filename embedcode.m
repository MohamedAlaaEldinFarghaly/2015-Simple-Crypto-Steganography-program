function [ new ] = embedcode( final,source )
%This Function gets the inputs (final=the encryption code from the
%program,source=the original image converted to 16bit type) and return a
%new image (new) has the code embedded in it

%the maximum of the image pixel capacity is 2^16=from 0 to 65535 so the
%final will be change to fit the image =s_final

s_final=floor(final/1000); %the less nearest integer for division by 1000
remain=mod(final,1000);  %store the remainder in another matrix (remain)

%increments of storing elements in the image matrix 

[m,n,q]=size(source);
[M,N]=size(s_final);
inc_i=floor(m/M);        
inc_j=floor(n/N);

%k,l used to increment 1 step in s_final matrix and if statement to move
%step to next row(l<=N) and finish storing(k<=M)
k=1;
l=1;
%storing the code matrix in image matrix by adding or subtraction 
for i=1:inc_i:m
    if k<=M
    for j=1:inc_j:n
        if l<=N
            %store the code (s_final) in page 1 in the image by addition or
            %subtraction (using subtraction to avoid get 
            %the maximun number 65535 when exceeding the maximum by
            %addition
            
            if s_final(k,1)>65535-source(i,j,1)
                source(i,j,1)=source(i,j,1)-s_final(k,l);
            else
                source(i,j,1)=source(i,j,1)+s_final(k,l); 
            end
            
            %Storing  remainder matrix in page 2 of the image matrix by
            %addition or subtraction by the same method in 1
            
            if remain(k,1)>65535-source(i,j,2)
                source(i,j,2)=source(i,j,2)-remain(k,l);  
            else
                source(i,j,2)=source(i,j,2)+remain(k,l);  
            end
            l=l+1;
        end
    end
    k=k+1;
    l=1;
    end
end


new=source;




end

