
fil='*.mat';
fs=250;  %frequenza di campionamento
n_ch=19; %numero di canali

for count=1:3  
    switch count
        case 1
            type='GNSZ30';
            inDir='C:/Users/simon/Desktop/DatasetGNSZ_30/';
        case 2 
            type='FNSZ30';
            inDir='C:/Users/simon/Desktop/DatasetFNSZ_30/';
        case 3
            type='CTRL30';
            inDir='C:/Users/simon/Desktop/DatasetCTRL_30/';
    end
    cases=dir(fullfile(inDir,fil));
    
    QC=["paziente", "quality check"];
    for i=1:length(cases)
        name=cases(i).name(1:8);
        EEG = pop_importdata('dataformat','matlab','nbchan',n_ch,'data',strcat(inDir,cases(i).name),'setname',name,'srate',fs,'pnts',0,'xmin',0);
        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off');
        EEG = pop_eegfiltnew(EEG, 1,40,826,0,[],1);
        EEG = eeg_checkset( EEG );
        pop_eegplot( EEG, 1, 1, 1);
        x=[string(name), string(input('Quality check\n','s'))];
        QC=[QC; x];
    
    end

    save(strcat(type,'_QC.mat'),'QC')
end

