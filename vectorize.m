function x=vectorize(type)
    fil='*.mat'; 
    n_ch=19;
    n_ep=2;
    n_bands=5;

    switch type
        case 'tm'
            F=zeros(1,n_ch*n_bands+1);
            G=F;
            C=F;
        
            inDirC='\Users\simon\Desktop\C30PSD15s_tm\';
            inDirG='\Users\simon\Desktop\G30PSD15s_tm\';
            inDirF='\Users\simon\Desktop\F30PSD15s_tm\';
            casesF=dir(fullfile(inDirF,fil));
            casesG=dir(fullfile(inDirG,fil));
            casesC=dir(fullfile(inDirC,fil));
        
            for i=1:length(casesG)
                load(strcat(inDirG,casesG(i).name));
                G=[G;"GNSZ", PSDtm(:)'];
            end
            for i=1:length(casesF)
                load(strcat(inDirF,casesF(i).name));
                F=[F;"FNSZ", PSDtm(:)'];
            end
            for i=1:length(casesC)
                load(strcat(inDirC,casesC(i).name));
                C=[C;"CTRL", PSDtm(:)'];
            end
        
        
            G(1,:)=[];
            F(1,:)=[];
            C(1,:)=[];
            x=[F;G;C];
            
        case 'cm'
            F=zeros(1,n_ep*n_bands+1);
            G=F;
            C=F;
        
            inDirC='\Users\simon\Desktop\C30PSD15s_cm\';
            inDirG='\Users\simon\Desktop\G30PSD15s_cm\';
            inDirF='\Users\simon\Desktop\F30PSD15s_cm\';
            casesF=dir(fullfile(inDirF,fil));
            casesG=dir(fullfile(inDirG,fil));
            casesC=dir(fullfile(inDirC,fil));
        
            for i=1:length(casesG)
                load(strcat(inDirG,casesG(i).name));
                G=[G;"GNSZ", PSDcm(:)'];
            end
            for i=1:length(casesF)
                load(strcat(inDirF,casesF(i).name));
                F=[F;"FNSZ", PSDcm(:)'];
            end
            for i=1:length(casesC)
                load(strcat(inDirC,casesC(i).name));
                C=[C;"CTRL", PSDcm(:)'];
            end
        
            G(1,:)=[];
            F(1,:)=[];
            C(1,:)=[];
            x=[F;G;C];
            
        case 'm'
            F=zeros(1,n_bands+1);
            G=F;
            C=F;
        
            inDirC='\Users\simon\Desktop\C30PSD15s_m\';
            inDirG='\Users\simon\Desktop\G30PSD15s_m\';
            inDirF='\Users\simon\Desktop\F30PSD15s_m\';
            casesF=dir(fullfile(inDirF,fil));
            casesG=dir(fullfile(inDirG,fil));
            casesC=dir(fullfile(inDirC,fil));
        
            for i=1:length(casesG)
                load(strcat(inDirG,casesG(i).name));
                G=[G;"GNSZ", PSDm];
            end
            for i=1:length(casesF)
                load(strcat(inDirF,casesF(i).name));
                F=[F;"FNSZ", PSDm];
            end
            for i=1:length(casesC)
                load(strcat(inDirC,casesC(i).name));
                C=[C;"CTRL", PSDm];
            end
        
            G(1,:)=[];
            F(1,:)=[];
            C(1,:)=[];
            x=[F;G;C];
    end
end
        