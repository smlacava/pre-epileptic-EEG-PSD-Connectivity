%% PHASE LOCKING VALUE 
function PLV=phase_locking_value(sig)
 
    n_ch=19; 
    PLV(1:n_ch,1:n_ch)=0; 
    complex_sig=hilbert(sig); 
    for i=1:n_ch     
        for j=1:n_ch        
            if i<j 
            %unwrap restituisce l'angolo di sfasamento in radianti
            PLV(i,j)=abs(mean(exp(1i*(unwrap(angle(complex_sig(:,i)))-unwrap(angle(complex_sig(:,j))))),1));
            PLV(j,i)=PLV(i,j);              
            end
        end
    end
end