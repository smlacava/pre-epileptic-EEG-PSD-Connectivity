%% PSD MEAN
%PSD media tra tutti i canali
%PSD media totale

%PSD media temporale (tengo la differenza spaziale)

%PSD media tra i canali (tengo la differenza temporale)

%keep all

%Le matrici sono 6*19*5 (epoche*canali*bande)

inDirG='\Users\simon\Desktop\G30PSD5s\';
inDirF='\Users\simon\Desktop\G30PSD5s\';
outDirG='\Users\simon\Desktop\G30PSD5s';
outDirF='\Users\simon\Desktop\F30PSD5s';
fil='*.mat'; 

n_ch=19;
n_ep=6;

for c=1:2
    switch c
        case 1
            inDir=inDirF;
            outDir=outDirF;
            tot_name='F';
            cases=dir(fullfile(inDirF,fil));
        case 2
            inDir=inDirG;
            outDir=outDirG;
            tot_name='G';
            cases=dir(fullfile(inDirG,fil));
    end
    
    L=length(cases);
    PSDcmtot=zeros(6,5);
    PSDtmtot=zeros(19,5);
    PSDmtot=zeros(1,5);
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
    filename_tot=strcat(outDir,'_tot');
    save(strcat(filename_tot,'_PSDcmtot\'),'PSDcmtot');
    save(strcat(filename_tot,'_PSDtmtot\'),'PSDtmtot');
    save(strcat(filename_tot,'_PSDmtot\'),'PSDmtot');
end
        
        