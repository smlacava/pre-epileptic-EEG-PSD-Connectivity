%% CONNECTIVITY  
n_ep=2; 
fs=250; 
n_ch=19;
t_ep=15;
fil='*.mat'; 
bands={'delta';'theta';'alpha';'beta';'gamma'};

for count=1:3
    switch count
        case 1
            type='GNSZ';
        case 2 
            type='FNSZ';
        case 3
            type='CTRL';
    end
    inDir=strcat('/Users/simon/Desktop/Dataset',type,'_30/');
    outDir=strcat('/Users/simon/Desktop/');
    cases=dir(fullfile(inDir,fil));
     
    PLI=zeros(length(cases),size(bands,1),n_ep,n_ch,n_ch);
    PLV=PLI;
    for i=1:length(cases)       
        load(strcat(inDir,cases(i).name));         
        for j=1:size(bands,1)             
            switch j                                    
                case 1                     
                    lf=1;                     
                    hf=4;                 
                case 2                     
                    lf=4;                     
                    hf=8;                 
                case 3                     
                    lf=8;                     
                    hf=13;                 
                case 4                     
                    lf=13;                     
                    hf=30;                 
                case 5                     
                    lf=30;                     
                    hf=40;             
            end
            for k=1:n_ep
                ti=((k-1)*fs*t_ep)+1;
                tf=k*fs*t_ep;
                data=eegfilt(sup(:,ti:tf),fs,lf,hf,0,[],0,'fir1',0);                 
                data=data';
                PLI(i,j,k,:,:)=phase_lag_index(data); 
                %PLI(casi,bande,epoche,ch,ch)
                PLV(i,j,k,:,:)=phase_locking_value(data);
                %PLV(casi,bande,epoche,ch,ch)
            end
        end
    end
    save(strcat(outDir,'PLI/PLI_',type,'.mat'),'PLI');
    save(strcat(outDir,'PLV/PLV_',type,'.mat'),'PLV');
end