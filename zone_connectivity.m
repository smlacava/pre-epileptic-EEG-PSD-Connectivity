% CONNECTIVY CEREBRAL ZONE 
load('/Users/simon/Desktop/PLI/PLI_GNSZ.mat');
PLI_F=PLI;
load('/Users/simon/Desktop/PLI/PLI_FNSZ.mat');
PLI_G=PLI;
load('/Users/simon/Desktop/PLI/PLI_CTRL.mat');
PLI_C=PLI;
load('/Users/simon/Desktop/PLV/PLV_FNSZ.mat');
PLV_F=PLV;
load('/Users/simon/Desktop/PLV/PLV_GNSZ.mat');
PLV_G=PLV;
load('/Users/simon/Desktop/PLV/PLV_CTRL.mat');
PLV_C=PLV;
%FP1 FP2 F3 F4 C3 C4 P3 P4 O1 O2 F7 F8 T3 T4 T5 T6 FZ CZ PZ
f=[1,2,3,4,11,12,17]; 
c=[5,6,18]; 
t=[13,14,15,16]; 
po=[7,8,9,10,19];
bands={'Delta';'Theta';'Alpha';'Beta';'Gamma'};
zones={'F_FC','F_FG','F_GC','C_FC','C_FG','C_GC','T_FC','T_FG','T_GC','PO_FC','PO_FG','PO_GC'};

for count=1:2
    switch count
        case 1
            frontal_C=zeros(size(PLI_C,2),size(PLI_C,1),length(f)); 
            frontal_F=zeros(size(PLI_F,2),size(PLI_F,1),length(f));
            frontal_G=zeros(size(PLI_G,2),size(PLI_G,1),length(f));
            central_C=zeros(size(PLI_C,2),size(PLI_C,1),length(c)); 
            central_F=zeros(size(PLI_F,2),size(PLI_F,1),length(c));
            central_G=zeros(size(PLI_G,2),size(PLI_G,1),length(c));
            temporal_C=zeros(size(PLI_C,2),size(PLI_C,1),length(t));
            temporal_F=zeros(size(PLI_F,2),size(PLI_F,1),length(t));
            temporal_G=zeros(size(PLI_G,2),size(PLI_G,1),length(t));
            par_occ_C=zeros(size(PLI_C,2),size(PLI_C,1),length(po));
            par_occ_F=zeros(size(PLI_F,2),size(PLI_F,1),length(po));
            par_occ_G=zeros(size(PLI_G,2),size(PLI_G,1),length(po));
            outDir='/Users/simon/Desktop/PLI/Zone/';
            conn_C=PLI_C;
            conn_G=PLI_G;
            conn_F=PLI_F;
        case 2
            frontal_C=zeros(size(PLV_C,2),size(PLV_C,1),length(f)); 
            frontal_F=zeros(size(PLV_F,2),size(PLV_F,1),length(f));
            frontal_G=zeros(size(PLV_G,2),size(PLV_G,1),length(f));
            central_C=zeros(size(PLV_C,2),size(PLV_C,1),length(c)); 
            central_F=zeros(size(PLV_F,2),size(PLV_F,1),length(c));
            central_G=zeros(size(PLV_G,2),size(PLV_G,1),length(c));
            temporal_C=zeros(size(PLV_C,2),size(PLV_C,1),length(t));
            temporal_F=zeros(size(PLV_F,2),size(PLV_F,1),length(t));
            temporal_G=zeros(size(PLV_G,2),size(PLV_G,1),length(t));
            par_occ_C=zeros(size(PLV_C,2),size(PLV_C,1),length(po));
            par_occ_F=zeros(size(PLV_F,2),size(PLV_F,1),length(po));
            par_occ_G=zeros(size(PLV_G,2),size(PLV_G,1),length(po));
            outDir='/Users/simon/Desktop/PLV/Zone/';
            conn_C=PLV_C;
            conn_G=PLV_G;
            conn_F=PLV_F;
    end

    for i=1:size(conn_C,2)         
        C=squeeze(conn_C(:,i,:,:,:));     
        F=squeeze(conn_F(:,i,:,:,:));
        G=squeeze(conn_G(:,i,:,:,:)); 
        for j=1:size(C,1)         
            for ep=1:size(f)             
                m=squeeze(C(j,ep,:,:));             
                frontal=sum(sum(m(f,f)))/(length(f)*length(f)-length(f));             
                central=sum(sum(m(c,c)))/(length(c)*length(c)-length(c));             
                temporal=sum(sum(m(t,t)))/(length(t)*length(t)-length(t));             
                par_occ=sum(sum(m(po,po)))/(length(po)*length(po)-length(po));
                frontal_C(i,j,ep)=frontal;             
                central_C(i,j,ep)=central;             
                temporal_C(i,j,ep)=temporal;             
                par_occ_C(i,j,ep)=par_occ;

            end
        end
        for j=1:size(F,1)         
            for ep=1:size(po)             
                m=squeeze(F(j,ep,:,:));             
                frontal=sum(sum(m(f,f)))/(length(f)*length(f)-length(f));             
                central=sum(sum(m(c,c)))/(length(c)*length(c)-length(c));             
                temporal=sum(sum(m(t,t)))/(length(t)*length(t)-length(t));             
                par_occ=sum(sum(m(po,po)))/(length(po)*length(po)-length(po));
                frontal_F(i,j,ep)=frontal;             
                central_F(i,j,ep)=central;             
                temporal_F(i,j,ep)=temporal;            
                par_occ_F(i,j,ep)=par_occ;         
            end
        end
        for j=1:size(G,1)         
            for ep=1:size(po)             
                m=squeeze(G(j,ep,:,:));             
                frontal=sum(sum(m(f,f)))/(length(f)*length(f)-length(f));             
                central=sum(sum(m(c,c)))/(length(c)*length(c)-length(c));             
                temporal=sum(sum(m(t,t)))/(length(t)*length(t)-length(t));             
                par_occ=sum(sum(m(po,po)))/(length(po)*length(po)-length(po));
                frontal_G(i,j,ep)=frontal;             
                central_G(i,j,ep)=central;             
                temporal_G(i,j,ep)=temporal;            
                par_occ_G(i,j,ep)=par_occ;         
            end
        end
    end
    frontal_C=squeeze(mean(frontal_C,3)); 
    central_C=squeeze(mean(central_C,3)); 
    temporal_C=squeeze(mean(temporal_C,3)); 
    par_occ_C=squeeze(mean(par_occ_C,3));   
    frontal_F=squeeze(mean(frontal_F,3)); 
    central_F=squeeze(mean(central_F,3)); 
    temporal_F=squeeze(mean(temporal_F,3)); 
    par_occ_F=squeeze(mean(par_occ_F,3));
    frontal_G=squeeze(mean(frontal_G,3)); 
    central_G=squeeze(mean(central_G,3)); 
    temporal_G=squeeze(mean(temporal_G,3)); 
    par_occ_G=squeeze(mean(par_occ_G,3));
    
    Z=vectorize_Z(par_occ_C,temporal_C,central_C,frontal_C,par_occ_F,temporal_F,central_F,frontal_F,par_occ_G,temporal_G,central_G,frontal_G);
    save(strcat(outDir,'vectorized'),'Z')
    
    Pf_fc=zeros(size(frontal_F,1),1);
    Pf_fg=Pf_fc;
    Pf_gc=Pf_fc;
    Pc_fc=zeros(size(central_F,1),1);
    Pc_fg=Pc_fc;
    Pc_gc=Pc_fc;
    Pt_fc=zeros(size(temporal_F,1),1);
    Pt_fg=Pt_fc;
    Pt_gc=Pt_fc;
    Ppo_fc=zeros(size(par_occ_F,1),1);
    Ppo_fg=Ppo_fc;
    Ppo_gc=Ppo_fc;
    for k=1:size(frontal_F,1)     
        Pf_fc(k,1)=ranksum(frontal_F(k,:),frontal_C(k,:));
        Pf_fg(k,1)=ranksum(frontal_F(k,:),frontal_G(k,:));
        Pf_gc(k,1)=ranksum(frontal_G(k,:),frontal_C(k,:));
    end
    for k=1:size(central_F,1)     
        Pc_fc(k,1)=ranksum(central_F(k,:),central_C(k,:));
        Pc_fg(k,1)=ranksum(central_F(k,:),central_G(k,:));
        Pc_gc(k,1)=ranksum(central_G(k,:),central_C(k,:));
    end
    for k=1:size(temporal_F,1)     
        Pt_fc(k,1)=ranksum(temporal_F(k,:),temporal_C(k,:));
        Pt_fg(k,1)=ranksum(temporal_F(k,:),temporal_G(k,:));
        Pt_gc(k,1)=ranksum(temporal_G(k,:),temporal_C(k,:));
    end
    for k=1:size(par_occ_F,1)    
        Ppo_fc(k,1)=ranksum(par_occ_F(k,:),par_occ_C(k,:));
        Ppo_fg(k,1)=ranksum(par_occ_F(k,:),par_occ_G(k,:));
        Ppo_gc(k,1)=ranksum(par_occ_G(k,:),par_occ_C(k,:));
    end

    P=[Pf_fc,Pf_fg,Pf_gc,Pc_fc,Pc_fg,Pc_gc,Pt_fc,Pt_fg,Pt_gc,Ppo_fc,Ppo_fg,Ppo_gc];
    P=[[' ';bands],[zones;string(P)]];
    save(strcat(outDir,'P.mat'),'P')
end