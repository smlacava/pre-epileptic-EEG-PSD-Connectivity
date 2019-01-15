# Tesi
Spiegazione di script e funzioni e ordine:

Check_data: estrae dei dati dal database.
  
pick30: estrae i soli 30 secondi di segnale antecedenti alla prima crisi epilettica, sfruttando le tabelle presentanti per ogni tracciato il rispettivo tempo di inizio della crisi.

Quality_Check30: filtra i segnali con un passabanda tra 1 e 40 Hz per delimitare la banda interessata ed effettuare un controllo visivo sui segnali, crea tre tabelle (FNSZ30_QC, GNSZ30_QC e CTRL30_QC) per risalire ai tracciati non utilizzabili ed effettuare la successiva scrematura.
	

psd15s: fornisce la psd ogni 15 secondi di ogni tracciato (per un totale di 2 valori per ogni ritmo per ogni canale).
	
PSDmean: esegue la media globale, temporale e spaziale dell'output di psd15s.

vectorize: funzione utilizzata per manipolare le matrici per renderle più facilmente utilizzabili per l'analisi statistica
	(jamovi) e la classificazione (neuropredict).
	
connectivity30: fornisce le misure di connettività tra i canali per ogni banda di interesse, attraverso le misure PLI e PLV.

phase_lag_index: fornisce la misura PLI.

phase_locking_value: fornisce la misura PLV.

Asymmetry: valuta la differenza di connettività tra parte sinistra e destra del cervello e fornisce il P value relativo alla statistica sull'asimmetria.

Zone_connectivity: valuta la differenza di connettività tra le aree cerebrali (temporale, frontale, centrale, parietale-occipitale) e fornisce il P value su tali valori di connettività.
