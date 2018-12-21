# Tesi
Spiegazione di script e funzioni e ordine:

Check_data: script utilizzato per l'estrazione dei dati dal database e filtrare i segnali con un passabanda tra 1 e 40 Hz
  per delimitare la banda interessata (il filtraggio viene eseguito nel primo script per agevolare il successivo controllo
  visivo).
  
pick: funzione utilizzata per estrarre i soli "t" secondi di segnale (30, 60, 100 o 120) antecedenti alla prima crisi
  epilettica, sfruttando le tabelle presentanti per ogni tracciato il rispettivo tempo di inizio della crisi.
  
quality_check: script utilizzato per effettuare un controllo visivo sui segnali e, attraverso due tabelle da questo create
  (FNSZ30_QC e GNSZ30_QC), risalire ai tracciati non utilizzabili per effettuare la successiva scrematura.
	
bands_filter: script utilizzato per filtrare passabanda i segnali e ottenere i singoli ritmi (non più utilizzato).

psd5s: script utilizzato per ottenere la psd ogni 5 secondi di ogni tracciato (per un totale di 6 valori per ogni ritmo 
	per ogni canale).
	
PSDmean: script utilizzato per fare la media globale, temporale e spaziale dell'output di psd5s.

vectorize: funzione utilizzata per manipolare le matrici per renderle più facilmente utilizzabili per l'analisi statistica
	(jamovi) e la classificazione (neuropredict).
