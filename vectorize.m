function x=vectorize(type)
fil='*.mat'; 
n_ch=19;
n_ep=6;
n_ba=5;

switch type
    case 'tm'
        F=zeros(1,n_ch*n_ba+1);
        G=F;
        
        inDirG='\Users\simon\Desktop\G30PSD5s_tm\';
        inDirF='\Users\simon\Desktop\F30PSD5s_tm\';
        casesF=dir(fullfile(inDirF,fil));
        casesG=dir(fullfile(inDirG,fil));
        
        for i=1:length(casesG)
            load(strcat(inDirG,casesG(i).name));
            G=[G;"G", PSDtm(:)'];
        end
        for i=1:length(casesF)
            load(strcat(inDirF,casesF(i).name));
            F=[F;"F", PSDtm(:)'];
        end
        
        G(1,:)=[];
        F(1,:)=[];

        x=[F;G];
    case 'cm'
        F=zeros(1,n_ep*n_ba+1);
        G=F;
        
        inDirG='\Users\simon\Desktop\G30PSD5s_cm\';
        inDirF='\Users\simon\Desktop\F30PSD5s_cm\';
        casesF=dir(fullfile(inDirF,fil));
        casesG=dir(fullfile(inDirG,fil));
        
        for i=1:length(casesG)
            load(strcat(inDirG,casesG(i).name));
            G=[G;"G", PSDcm(:)'];
        end
        for i=1:length(casesF)
            load(strcat(inDirF,casesF(i).name));
            F=[F;"F", PSDcm(:)'];
        end
        
        G(1,:)=[];
        F(1,:)=[];

        x=[F;G];
    case 'm'
        F=zeros(1,n_ba+1);
        G=F;
        
        inDirG='\Users\simon\Desktop\G30PSD5s_m\';
        inDirF='\Users\simon\Desktop\F30PSD5s_m\';
        casesF=dir(fullfile(inDirF,fil));
        casesG=dir(fullfile(inDirG,fil));
        
        for i=1:length(casesG)
            load(strcat(inDirG,casesG(i).name));
            G=[G;"G", PSDm];
        end
        for i=1:length(casesF)
            load(strcat(inDirF,casesF(i).name));
            F=[F;"F", PSDm];
        end
        
        G(1,:)=[];
        F(1,:)=[];

        x=[F;G];
end
end
        