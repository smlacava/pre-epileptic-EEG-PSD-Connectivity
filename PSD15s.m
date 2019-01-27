fil='*.mat'; 
fs=250; 
n_bands=5; 
dt=fs*15;
n_epochs=2;

for count=1:3
    switch count
        case 1
            type='FNSZ';
        case 2
            type='GNSZ';
        case 3
            type='CTRL';
    end
    inDir=strcat('/Users/simon/Desktop/Dataset',type,'_30/');
    outDir=strcat('/Users/simon/Desktop/',type(1),'30PSD15s/');
    cases=dir(fullfile(inDir,fil));
    
    for i=1:length(cases)
    
        EEG=load(strcat(inDir,cases(i).name));
        psd=zeros(n_epochs, size(EEG.sup,1),n_bands);
        for k = 1:n_epochs
        
            for j=1:size(EEG.sup,1)
                data=squeeze(EEG.sup(j,(k-1)*dt+1:k*dt));            
                [pxx,w]=pwelch(data,[],0,[],fs);          
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
