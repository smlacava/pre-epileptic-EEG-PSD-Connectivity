fil='*.mat';
t=30;
fs=250;                                    %frequenza di campionamento
delta=t*fs;                                %numero di campioni totali

for type=1:3
    
    switch type
        case 1
            load('GNSZtime.mat');
            time_table=GNSZtime;
            inDir='C:/Users/simon/Desktop/DatasetGNSZmat/';
            outDir=strcat('C:/Users/simon/Desktop/DatasetGNSZ_30/');
        case 2 
            load('FNSZtime.mat');
            time_table=FNSZtime;
            inDir='C:/Users/simon/Desktop/DatasetFNSZmat/';
            outDir=strcat('C:/Users/simon/Desktop/DatasetFNSZ_30/');
        case 3
            load('CTRLtime.mat');
            time_table=CTRLtime;
            inDir='C:/Users/simon/Desktop/DatasetCTRLmat/';
            outDir=strcat('C:/Users/simon/Desktop/DatasetCTRL_30/');
    end
    cases=dir(fullfile(inDir,fil));

    for i=1:length(cases)
        sup=load(strcat(inDir,cases(i).name));
        filename=strcat(outDir,cases(i).name,'_30.mat');
        for j=1:max(size(time_table))
            x=time_table(j,1);
            x_time=str2double(time_table(j,2));
            if x_time>=30
                if strncmpi(cases(i).name,x,18)==1
                    tmax=floor(x_time*fs);
                    sup=sup.my_data(:,tmax-delta:tmax-1);
                    save(filename,'sup')
                end
            end
        end         
    end
end