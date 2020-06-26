function [ code ] = getmassage( final )
format long
v=length(final)./2;
%get the number of rows of O and g
as=v.^2;
%get the number of elements in the matrix g and O
final=final';
g=final(as+1:2*(as));
O=final(1:as);
g=reshape(g,v,v);
O=reshape(O,v,v);
%separate and reshape both O and g 
g=g';
O=O';
O=O/g;
he=O(as);
%truncate the random number of elements in the O matrix 
%to get the length of the real message.
he=round(he);
% due to round offs the length of the matrix might not be an integer
O=O(1:he);
% New O which has only the message letters code and no random numbers at
% the end of the matrix
C=1000*[0.6892145,0.7481516,0.4515416,0.08982138,0.2289770,0.9133373,0.1523780,0.8258170,0.5383424,0.9961347,0.07817553,0.4426783,0.1066528,0.9618981,0.004634224,0.7749104,0.8173032,0.8286947,0.08443584,0.3997827,0.2598704,0.8000685,0.4314138,0.9106476,0.1808470,0.2638029,0.1455390,0.1360686,0.8692922,0.5797046,0.5498602,0.1449548,0.8530311,0.6220551,0.3509524,0.5132495,0.4018080,0.07596669,0.2499162,0.1233189,0.1819078,0.2399525,0.4172671,0.04965443,0.9027161,0.9447872,0.4908641,0.4892526,0.3377194,0.9000539,0.3692468,0.1112028,0.7842520,0.3897388,0.2416913,0.4039122,0.09645452,0.1319733,0.9420506,0.9561346,0.5752086,0.05977954,0.2347799,0.3531586,0.8211941,0.01540344,0.04302380,0.1689900,0.6491155,0.7317224,0.6477460,0.4509237,0.5470089,0.2963208,0.7446928,0.1889550,0.6867754,0.1835112,0.3684846,0.6256186,0.7802274,0.08112577,0.9293860,0.7757127,0.4867916,0.4358586,0.4467838,0.3063495,0.5085087,0.5107716,0.8176277,0.7948314,0.6443181,0.3786094,0.8115805,0.5328256;];
C=round(C);
%C is the key matrix
B=32:127;
K=zeros(size(O));
for i=1:he
for j=1:length(B)
if abs(O(i)-C(j))<0.1
K(i)=B(j);
end 
end 
end
%replace every number wih the corresponding ASCII code and put it in a new
%matrix K
code=char(K);
%convert every ASCII code to its character
if code(length(code))~='>'
    code(length(code)+1)='>';
    
end
%this if condition is explained in the report it simply assures that the
%last character if the message is '>'



end

