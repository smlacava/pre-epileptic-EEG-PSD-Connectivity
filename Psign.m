function s=Psign(connectivity,type)
load(strcat('\Users\simon\Desktop\',connectivity,'\',type,'\P.mat'));
s={'band','type'};
for i=2:size(P,1)
    for j=2:size(P,2)
        if str2double(P(i,j))<0.05
            s=[s;[P(i,1),P(1,j)]];
        end
    end
end
