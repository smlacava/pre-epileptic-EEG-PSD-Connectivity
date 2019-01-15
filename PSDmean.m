%% PSD MEAN
%PSD media tra tutti i canali
%PSD media totale

%PSD media temporale (tengo la differenza spaziale)

%PSD media tra i canali (tengo la differenza temporale)

%keep all

%Le matrici sono 6*19*5 (epoche*canali*bande)

fil='*.mat'; 
n_ch=19;
n_ep=2;
n_bands=5;

for c=1:3
    switch c
        case 1
            type='F';
        case 2
            type='G';
        case 3
            type='C';
    end
    
    inDir=strcat('\Users\simon\Desktop\',type,'30PSD15s\');
    outDir=strcat('\Users\simon\Desktop\',type,'30PSD15s');
    cases=dir(fullfile(inDir,fil));
    L=length(cases);
    PSDcmtot=zeros(n_ep,n_bands);
    PSDtmtot=zeros(n_ch,n_bands);
    PSDmtot=zeros(1,n_bands);
    for i=1:L  %for each subject
        load(strcat(inDir,cases(i).name));
        PSDcm=squeeze(sum(psd,2))/n_ch;   %PSD media tra i canali
        PSDtm=squeeze(sum(psd,1))/n_ep;   %PSD media tra le epoche
        PSDm=squeeze(sum(PSDtm))/n_ch;    %PSD media totale
        
        filename_cm=strcat(outDir,'_cm\',strtok(cases(i).name(1:8),'.'),'_PSDcm');
        filename_tm=strcat(outDir,'_tm\',strtok(cases(i).name(1:8),'.'),'_PSDtm');
        filename_m=strcat(outDir,'_m\',strtok(cases(i).name(1:8),'.'),'_PSDm');
        save(filename_cm,'PSDcm');
        save(filename_tm,'PSDtm');
        save(filename_m,'PSDm');
        
        PSDcmtot=PSDcmtot+PSDcm;
        PSDtmtot=PSDtmtot+PSDtm;
        PSDmtot=PSDmtot+PSDm;
    end
    PSDcmtot=PSDcmtot/L;
    PSDtmtot=PSDtmtot/L;
    PSDmtot=PSDmtot/L;
    filename_tot=strcat(outDir,'_tot\');
    save(strcat(filename_tot,type,'_PSDcmtot'),'PSDcmtot');
    save(strcat(filename_tot,type,'_PSDtmtot'),'PSDtmtot');
    save(strcat(filename_tot,type,'_PSDmtot'),'PSDmtot');
end
        
        