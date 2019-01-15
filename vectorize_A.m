function A=vectorize_A(asy_C,asy_F,asy_G)

a_F=asy_F';
a_G=asy_G';
a_C=asy_C';

name_C={};
for i=1:max(size(a_C))
    name_C=[name_C; 'C'];
end
name_F={};
for i=1:max(size(a_F))
    name_F=[name_F; 'F'];
end
name_G={};
for i=1:max(size(a_G))
    name_G=[name_G; 'G'];
end


A=[[name_F,string(a_F)];[name_G,string(a_G)];[name_C,string(a_C)]];