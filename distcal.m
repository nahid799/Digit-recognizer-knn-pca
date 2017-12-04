
function [d] = distcal(x,y,operation)
x=x';
y=y';
d=0;
if strcmp(operation,'euclidean')
    for i=1:size(x)
        d=d + (x(i)-y(i))*(x(i)-y(i));
    end
    d=sqrt(d);
end

if strcmp(operation,'manhattan')
    for i=1:size(x)
        d=d + abs(x(i)-y(i));
    end
end

if strcmp(operation,'hamming')
    for i=1:size(x)
        d=d + (x(i)~=y(i));
    end
end

        
 
end

