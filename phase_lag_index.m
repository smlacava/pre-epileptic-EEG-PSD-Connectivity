%% PHASE LAG INDEX 
function PLI=phase_lag_index(sig) 

    n_ch=19; 
    PLI(1:n_ch,1:n_ch)=0;
    
    % hilbert(sig) calcola il segnale analitico complesso (trasformata di 
    % Hilbert) di ogni colonna di sig
    complex_sig=hilbert(sig); 
 
    for i=1:n_ch     
        for j=1:n_ch         
            if i<j 
                
            %sign restituisce il segno (1 per valori positivi, 0 per valori
            %pari a zero e -1 per valori negativi)
            %angle restituisce l'angolo di fase (in radianti)
            PLI(i,j)=abs(mean(sign(angle(complex_sig(:,i)./complex_sig(:,j)))));         

            %uguali calcolando sign               
            PLI(j,i)=PLI(i,j);              
            end
        end
    end
end