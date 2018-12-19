inDirG='\Users\simon\Desktop\DatasetGNSZ_30\';
inDirF='\Users\simon\Desktop\DatasetFNSZ_30\';
outDirG='\Users\simon\Desktop\G30PSD5s\';
outDirF='\Users\simon\Desktop\F30PSD5s\';
fil='*.mat'; 

fs=250; 
n_bands=5; 
dt=fs*5;

for c=1:2
    switch c
        case 1
            inDir=inDirF;
            outDir=outDirF;
            cases=dir(fullfile(inDirF,fil));
        case 2
            inDir=inDirG;
            outDir=outDirG;
            cases=dir(fullfile(inDirG,fil));
    end
    
    for i=1:length(cases)  %for each subject
    
        EEG=load(strcat(inDir,cases(i).name));
        %psd = zeros(size(EEG.sup,3),size(EEG.sup,1),n_PSD);
        psd=zeros(6, size(EEG.sup,1),n_bands);
        for k = 1:6 %for each epoch
        
            for j=1:size(EEG.sup,1) %for each channel
                data=squeeze(EEG.sup(j,fs*k+1:fs*k+dt));
                %data=squeeze(EEG.sup(j,:,k));             
                [pxx,w]=pwelch(data,[],0,[],fs);  %6 periodi da 5 secondi           
                deltaPower=sum(pxx(2:5));         %1-4 hz      
                thetaPower=sum(pxx(5:9));         %4-8 hz          
                alphaPower=sum(pxx(9:14));        %8-13 hz            
                betaPower=sum(pxx(14:32));        %13-30 hz      
                gammaPower=sum(pxx(32:42));       %30-40 hz       
                totalPower=sum(pxx(2:42));        %1-40 hz             

                psd(k,j,1)=deltaPower/totalPower;             
                psd(k,j,2)=thetaPower/totalPower;            
                psd(k,j,3)=alphaPower/totalPower;             
                psd(k,j,4)=betaPower/totalPower;            
                psd(k,j,5)=gammaPower/totalPower;         
            end
        end
    
        filename=strcat(outDir,strtok(cases(i).name,'.'),'_PSD.mat');
     
        save(filename,'psd'); 
        
    end
end
