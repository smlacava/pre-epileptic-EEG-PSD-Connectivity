% ASYMMETRY PLI & PLV
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
right=[2,4,6,8,10,12,14,16]; 
left=[1,3,5,7,9,11,13,15];
%FP1 FP2 F3 F4 C3 C4 P3 P4 O1 O2 F7 F8 T3 T4 T5 T6 FZ CZ PZ
bands={'Delta';'Theta';'Alpha';'Beta';'Gamma'};
types={'FC','FG','GC'};

for count=1:2
    switch count
        case 1
            asy_G=zeros(size(PLI_G,2),size(PLI_G,1),size(PLI_G,3)); 
            asy_F=zeros(size(PLI_F,2),size(PLI_F,1),size(PLI_F,3)); 
            asy_C=zeros(size(PLI_C,2),size(PLI_C,1),size(PLI_C,3));
            outDir='/Users/simon/Desktop/PLI/Asymmetry/';
            conn_C=PLI_C;
            conn_G=PLI_G;
            conn_F=PLI_F;
        case 2
            asy_G=zeros(size(PLV_G,2),size(PLV_G,1),size(PLV_G,3)); 
            asy_F=zeros(size(PLV_F,2),size(PLV_F,1),size(PLV_F,3)); 
            asy_C=zeros(size(PLV_C,2),size(PLV_C,1),size(PLV_C,3));
            outDir='/Users/simon/Desktop/PLV/Asymmetry/';
            conn_C=PLV_C;
            conn_G=PLV_G;
            conn_F=PLV_F;
    end

 
    for i=1:size(conn_C,2)       
        C=squeeze(conn_C(:,i,:,:,:));     
        G=squeeze(conn_G(:,i,:,:,:));
        F=squeeze(conn_F(:,i,:,:,:));
        for j=1:size(C,1)         
            for ep=1:size(C,2)             
                m=squeeze(C(j,ep,:,:));             
                r=sum(sum(m(right,right)))/(length(right)*length(right)-length(right));
                l=sum(sum(m(left,left)))/(length(left)*length(left)-length(left));
                asy_C(i,j,ep)=abs(r-l);         
            end
        end
    for j=1:size(G,1)         
        for ep=1:size(G,2)             
            m=squeeze(G(j,ep,:,:));             
            r=sum(sum(m(right,right)))/(length(right)*length(right)-length(right));
            l=sum(sum(m(left,left)))/(length(left)*length(left)-length(left));
            asy_G(i,j,ep)=abs(r-l);         
        end
    end
        for j=1:size(F,1)         
            for ep=1:size(C,2)             
                m=squeeze(F(j,ep,:,:));             
                r=sum(sum(m(right,right)))/(length(right)*length(right)-length(right));             
                l=sum(sum(m(left,left)))/(length(left)*length(left)-length(left));             
                asy_F(i,j,ep)=abs(r-l);         
            end
        end
    end
    asy_C=squeeze(mean(asy_C,3));
    asy_F=squeeze(mean(asy_F,3));
    asy_G=squeeze(mean(asy_G,3));
    
    A=vectorize_A(asy_C,asy_F,asy_G);
    save(strcat(outDir,'vectorized'),'A')
    
    Pfc=zeros(size(asy_G,1),1);
    Pfg=Pfc;
    Pgc=Pfc;
    for k=1:size(asy_G,1)     
        Pfc(k,1)=ranksum(asy_F(k,:),asy_C(k,:));
        Pfg(k,1)=ranksum(asy_F(k,:),asy_G(k,:));
        Pgc(k,1)=ranksum(asy_G(k,:),asy_C(k,:)); 
    end

    P=[[' '; bands],[types; string([Pfc, Pfg, Pgc])]];
    save(strcat(outDir,'P.mat'),'P')
end