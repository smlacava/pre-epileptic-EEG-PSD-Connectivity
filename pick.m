%% Pick
% Funzione che preleva da ogni traccia degli intervalli di t secondi,
%  definito dall'utente, precedenti alla crisi epilettica
%
% La funzione carica le matrici GNSZtime e FNSZtime, che contengono i tempi
%  di inizio delle crisi epilettiche generalizzate e focali,
%  rispettivamente
% L'intervallo t può essere di 30, 60, 100 o 120 secondi
% Le tracce risultanti vengono salvate nelle rispettive cartelle

function pick(t)
 fs=250;
    if t==30
        s='30';
    elseif t==60
        s='60';
    elseif t==100
        s='100';
    elseif t==120
        s='120';
    end
    


    load('GNSZtime.mat');
    inDirG='C:/Users/simon/Desktop/DatasetGNSZmat/';
    outDirG=strcat('C:/Users/simon/Desktop/DatasetGNSZ_',s,'/');
    fil='*.mat';
    casesG=dir(fullfile(inDirG,fil));
    fs=250;                                    %frequenza di campionamento
    delta=t*fs;                                %numero di campioni totali


    for i=1:length(casesG)
        G=load(strcat(inDirG,casesG(i).name));
        filename=strcat(outDirG,casesG(i).name,'_',s,'.mat');
        for j=1:max(size(GNSZtime))
            ctrl=GNSZtime(j,1);
            ctrl_time=str2double(GNSZtime(j,2));
            if ctrl_time>=t
                if strncmpi(casesG(i).name,ctrl,18)==1
                    tmax=floor(ctrl_time*fs);
                    sup=G.my_data(:,tmax-delta:tmax-1);
                    save(filename,'sup')
                end
            end
        end         
    end


    load('FNSZtime.mat');
    inDirF='C:/Users/simon/Desktop/DatasetFNSZmat/';
    outDirF=strcat('C:/Users/simon/Desktop/DatasetFNSZ_',s,'/');
    fil='*.mat';
    casesF=dir(fullfile(inDirF,fil));
    fs=250;                                    %frequenza di campionamento
    delta=t*fs;                                %numero di campioni totali


    for i=1:length(casesF)
        F=load(strcat(inDirF,casesF(i).name));
        filename=strcat(outDirF,casesF(i).name,'_',s,'.mat');
        for j=1:max(size(FNSZtime))
            ctrl=FNSZtime(j,1);
            ctrl_time=str2double(FNSZtime(j,2));
            if ctrl_time>=t
                if strncmpi(casesF(i).name,ctrl,18)==1
                    tmax=floor(ctrl_time*fs);
                    %sup=F.my_data(:,tmax-delta:tmax-1);
                    sup=eegfilt(F.my_data(:,tmax-delta:tmax-1),fs,1,40,0,[],0,'fir1',0);
                    save(filename,'sup')
                end
            end
        end         
    end

 %   clear all
end
