%X is our new image we want to identify
%A is our array of training data
%Class is the number value corresponding to every image in training set
% K is the parameter for th KNN

function [RESULT] = KNN(X, A, class,K,dist)
distances=zeros(2,K);
for i=1:size(class)
    if class(i)== 0
        
        class(i)=10;
    end
end
%class(class==0)=10;
%For every ROW
for i = 1:size(A,1)
    %Calculate the distance between this row and our image
    %note that distance is a vector of pairs, the first element is the
    %distance and the second one is the digit number corresponding to the
    %image in the traing set
    P= A(i,:);
    %distcal is our implemented method for finding the distance but it is
    %slower. pdist2 in function of the statistical toolbox in matlab.
    
    %d = distcal(P,X,dist)
    d = pdist2(P,X,dist);
    %d;
    %Add this distance to our distances array
    distances(:,i) = [d,class(i) ];
    %Sort the distance
    
    
end
%sort distances according to increasing order of distances
distances= sortrows(distances',1)';
%now our first K elements are the nearest neighbors
%Now count how many times every digit is repeated in the first K
%neighbors
digits=zeros(2,10);
% digits2=zeros(2,10);

for i= 1:K
    
    digits(1,distances(2,i))= digits(1,distances(2,i))+1;
    digits(2,distances(2,i))= distances(2,i);
    
%     digits2(1,distances(2,i))= digits2(1,distances(2,i))+distances(1,i);
%     digits2(2,distances(2,i))= distances(2,i);
    
    %         if distances(2,i) == 0
    %         digits(1,10)= digits(1,10)+1;
    %         digits(2,10)= 0;
    %         digits(1,10)= digits(1,10)+distances(1,i);
    %         digits(2,10)= 0;
    %         end
end
%sort # of repetitions and take digit with max repititions
digits=sortrows(digits',1)';
%digits;
% percentage=digits;
% percentage(1,:)= percentage(1,:)/K;
% digits2=sortrows(digits2',1)';
%digits;
% RESULT2=digits2(end,end);
RESULT=digits(end,end);






