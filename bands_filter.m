inDirG='C:\Users\simon\Desktop\DatasetGNSZ_30\';
inDirF='C:\Users\simon\Desktop\DatasetFNSZ_30\';
outDirF='C:\Users\simon\Desktop\FNSZ30';
outDirG='C:\Users\simon\Desktop\GNSZ30';
fs=250; 
fil='*.mat'; 
bands={'delta';'theta';'alpha';'beta';'gamma'}; 

for type=1:2
    switch type
        case 1
            inDir=inDirG;
            outDir=outDirG;
        case 2
            inDir=inDirF;
            outDir=outDirF;
    end
    cases=dir(fullfile(inDir,fil)); 
    
    for i=1:length(cases)          
        EEG=load(strcat(inDir,cases(i).name));         
        for b=1:size(bands,1)             
            switch b                                    
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
            data=eegfilt(squeeze(EEG.sup(:,:)),fs,lf,hf,0,[],0,'fir1',0);                 
            filename=string(strcat(outDir,bands(b),'\',cases(i).name(1:8),'\'));
            save(filename, 'data')
            end
        end 
end