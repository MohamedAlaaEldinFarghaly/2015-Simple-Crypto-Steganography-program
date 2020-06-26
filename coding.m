function [ final ] = coding( vmessage )

format long
he=length(vmessage);
% take the message from the user
vmessage(he+1)='>';
vmessage(he+2)='<';
% put '>' and '<' at the end of the message
vmessage=circshift(vmessage,[0,1]);
%move '<' to the beging of the message, the messaf becomes surrounded by
%'<' and '>'< that's the message becomes '<message'>'
A=double(vmessage);
%convert every char to its ASCII code
he=he+2;
% because we added '<' and '>' , that's the length of the message is
% incremented by 2
B=[32:127];
hi=length(B);
C=1000*[0.6892145,0.7481516,0.4515416,0.08982138,0.2289770,0.9133373,0.1523780,0.8258170,0.5383424,0.9961347,0.07817553,0.4426783,0.1066528,0.9618981,0.004634224,0.7749104,0.8173032,0.8286947,0.08443584,0.3997827,0.2598704,0.8000685,0.4314138,0.9106476,0.1808470,0.2638029,0.1455390,0.1360686,0.8692922,0.5797046,0.5498602,0.1449548,0.8530311,0.6220551,0.3509524,0.5132495,0.4018080,0.07596669,0.2499162,0.1233189,0.1819078,0.2399525,0.4172671,0.04965443,0.9027161,0.9447872,0.4908641,0.4892526,0.3377194,0.9000539,0.3692468,0.1112028,0.7842520,0.3897388,0.2416913,0.4039122,0.09645452,0.1319733,0.9420506,0.9561346,0.5752086,0.05977954,0.2347799,0.3531586,0.8211941,0.01540344,0.04302380,0.1689900,0.6491155,0.7317224,0.6477460,0.4509237,0.5470089,0.2963208,0.7446928,0.1889550,0.6867754,0.1835112,0.3684846,0.6256186,0.7802274,0.08112577,0.9293860,0.7757127,0.4867916,0.4358586,0.4467838,0.3063495,0.5085087,0.5107716,0.8176277,0.7948314,0.6443181,0.3786094,0.8115805,0.5328256;];
%random matrix C (The key matrix)
C=round(C);

O=zeros(size(A));
% O is the new matrix that the code will be in, evert ASCII code is
% replaced by a random number from the key marix (The one that have the
% same index)
for i=1:he
for j=1:hi
if A(i)==B(j)
O(i)=C(j);
end 
end 
end
% these two nested loop are responsible form the replacement process
% search what each element in A correspond to in B? (indces). that's 
%if the fifth elemen in our double matrix A equals the ASCII code of the
%letter 'D', the loop figures out that index and substitutes with the
%random number in the key matrix (that have the same index)
he2=he;
%new variable he2=he that we will get the clossest square number to
%it,that's if he2=5 , the clossest square is 9
%the reason for these steps are explained in the report
    while mod(sqrt(he2),1)~=0
        he2=he2+1;
    end
    if (he+1<he2)
    for i=he+1:he2-1
        O(i)=round(100*rand(1));
    end
    end
    
  O(he2)=he;
  %Assign the last entry in the matrix O the length of the original matrix
  %wihtout the random numbers
    
    v=sqrt(he2);
    O=reshape(O,v,v);
    %reshape our code matrix to a sqaure matrix
    g=100*rand(size(O));
    g=round(g);
    %g is a random matrix of the same size as our matrix O
    %multiply O by g to give us a new matrix O
    O=O*g;
    final=[O;g];
    %embed the new matrix O and g in the final matrix that's going to be
    %hidden in the photo
    
        



end

