
    if t==30
        s='30/';
    elseif t==60
        s='60/';
    elseif t==100
        s='100/';
    elseif t==120
        s='120/';
    end

    
    inDirF=strcat('C:/Users/simon/Desktop/DatasetFNSZ_',s);
    inDirG=strcat('C:/Users/simon/Desktop/DatasetGNSZ_',s);
    fil='*.mat';
    casesF=dir(fullfile(inDirF,fil));
    casesG=dir(fullfile(inDirG,fil));
    fs=250;  %frequenza di campionamento
    n_ch=19; %numero di canali
    FNSZ_QC=["paziente", "quality check"];
    GNSZ_QC=["paziente", "quality check"];

    for i=1:length(casesF)
        name=casesF(i).name(1:8);
        EEG = pop_importdata('dataformat','matlab','nbchan',n_ch,'data',strcat(inDirF,casesF(i).name),'setname',name,'srate',fs,'pnts',0,'xmin',0);
        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
        EEG = eeg_checkset( EEG );
        pop_eegplot( EEG, 1, 1, 1);
        x=[string(name), string(input('Quality check\n','s'))];
        FNSZ_QC=[FNSZ_QC; x];
    
    end

    for i=1:length(casesG)
        name=casesG(i).name(1:8);
        EEG = pop_importdata('dataformat','matlab','nbchan',n_chan,'data',strcat(inDirG,casesG(i).name),'setname',name,'srate',fs,'pnts',0,'xmin',0);
        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
        EEG = eeg_checkset( EEG );
        pop_eegplot( EEG, 1, 1, 1);
        x=[string(name), string(input('Quality check\n','s'))];
        GNSZ_QC=[GNSZ_QC; x];
    end

    save(strcat('FNSZ',s,'_QC.mat'),'FNSZ_QC')
    save(strcat('GNSZ',s,'_QC.mat'),'GNSZ_QC')

