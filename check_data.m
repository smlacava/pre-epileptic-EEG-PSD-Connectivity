Dir='C:/Users/simon/Desktop/Dataset';
fil='*.edf';
fs=250; %frequenza di campionamento
%lf=1;
%hf=40;

for count=1:3
    switch count
        case 1
            type='GNSZ';
        case 2 
            type='FNSZ';
        case 3
            type='CTRL';
    end
    inDir=strcat(Dir,type,'/');
    outDir=strcat(Dir,type,'mat/');
    cases=dir(fullfile(inDir,fil));
    
    for i=1:length(cases)
        EEG=pop_biosig(strcat(inDir,cases(i).name));
        filename=strcat(outDir,strtok(cases(i).name,'.'),'_datapreprocessed.mat');
        EEG=pop_resample(EEG,fs);
        
        ctrlChan=EEG.chanlocs(1).labels;
        if strncmpi(ctrlChan,'EEG FP1-LE',10)==1
            EEG = pop_select( EEG,'channel',{'EEG FP1-LE' 'EEG FP2-LE' 'EEG F3-LE' 'EEG F4-LE' 'EEG C3-LE' 'EEG C4-LE' 'EEG P3-LE' 'EEG P4-LE' 'EEG O1-LE' 'EEG O2-LE' 'EEG F7-LE' 'EEG F8-LE' 'EEG T3-LE' 'EEG T4-LE' 'EEG T5-LE' 'EEG T6-LE' 'EEG FZ-LE' 'EEG CZ-LE' 'EEG PZ-LE'});
        else
            EEG = pop_select( EEG,'channel',{'EEG FP1-REF' 'EEG FP2-REF' 'EEG F3-REF' 'EEG F4-REF' 'EEG C3-REF' 'EEG C4-REF' 'EEG P3-REF' 'EEG P4-REF' 'EEG O1-REF' 'EEG O2-REF' 'EEG F7-REF' 'EEG F8-REF' 'EEG T3-REF' 'EEG T4-REF' 'EEG T5-REF' 'EEG T6-REF' 'EEG FZ-REF' 'EEG CZ-REF' 'EEG PZ-REF'});
        end
        my_data=EEG.data;
        save(filename,'my_data');
    end
end
