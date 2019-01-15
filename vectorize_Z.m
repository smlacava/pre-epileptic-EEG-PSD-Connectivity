function Z=vectorize_Z(par_occ_C,temporal_C,central_C,frontal_C,par_occ_F,temporal_F,central_F,frontal_F,par_occ_G,temporal_G,central_G,frontal_G)

po_C=par_occ_C';
t_C=temporal_C';
c_C=central_C';
f_C=frontal_C';
po_F=par_occ_F';
t_F=temporal_F';
c_F=central_F';
f_F=frontal_F';
po_G=par_occ_G';
t_G=temporal_G';
c_G=central_G';
f_G=frontal_G';

name_C={};
for i=1:max(size(po_C))
    name_C=[name_C; 'C'];
end
name_F={};
for i=1:max(size(po_F))
    name_F=[name_F; 'F'];
end
name_G={};
for i=1:max(size(po_G))
    name_G=[name_G; 'G'];
end

Zones_F=[name_F, string(po_F), string(t_F), string(f_F), string(c_F)];
Zones_G=[name_G, string(po_G), string(t_G), string(f_G), string(c_G)];
Zones_C=[name_C, string(po_C), string(t_C), string(f_C), string(c_C)];
Z=[Zones_F;Zones_G;Zones_C];