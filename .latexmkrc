# =============================================================
#  Configurazione di latexmk per l'IFA Report 2/2017it
#
#  Vale sia per la compilazione da riga di comando (basta "latexmk",
#  senza argomenti) sia per quella lanciata da VS Code / LaTeX Workshop,
#  che legge comunque questo file oltre a passare i propri flag.
# =============================================================

# --- motore: LuaLaTeX -----------------------------------------
# Il documento usa fontspec/polyglossia/unicode-math, quindi pdflatex
# non e' utilizzabile. Con pdf_mode = 4 non serve piu' passare -lualatex.
$pdf_mode  = 4;
$dvi_mode  = 0;
$postscript_mode = 0;

$lualatex = 'lualatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';

# --- file da compilare quando si invoca "latexmk" senza argomenti ---
@default_files = ('IFA-Report-2017it.tex');

# --- bibliografia ---------------------------------------------
# I comandi \bibliographystyle e \bibliography stanno in
# capitoli/cap09.tex, quindi \bibdata e \bibstyle finiscono in
# capitoli/cap09.aux: BibTeX ci arriva seguendo gli \@input dall'aux
# principale. Con bibtex_use = 2 il .bbl viene anche rimosso da
# "latexmk -C", cosi' non resta indietro una bibliografia vecchia.
$bibtex_use = 2;

# --- robustezza della catena ----------------------------------
# PERCHE' force_mode: se una passata di LuaLaTeX viene interrotta lascia
# un .aux vuoto o troncato. Alla compilazione successiva latexmk puo'
# decidere di eseguire BibTeX per primo; su un .aux vuoto BibTeX esce in
# errore ("I found no \citation commands") e senza questa opzione latexmk
# abbandona il lavoro - senza nemmeno provare LuaLaTeX. Risultato: lo
# stato sporco non si ripara da solo e il PDF resta con le citazioni [?].
# Con force_mode latexmk prosegue, LuaLaTeX rigenera un .aux valido e la
# compilazione si chiude correttamente.
# Nota: gli errori veri continuano a essere segnalati (nel log, nel
# pannello Problemi di VS Code e nel codice di uscita); questa opzione
# evita solo che la catena venga abbandonata a meta'.
$force_mode = 1;

# Alcune passate in piu': l'indice delle tabelle, tocbibind, hyperref e le
# longtable possono richiedere piu' giri prima di stabilizzare i rimandi.
$max_repeat = 7;

# --- pulizia ---------------------------------------------------
# "latexmk -c" rimuove gli ausiliari, "latexmk -C" anche il PDF.
# Aggiunti i file che latexmk non conosce di suo.
$clean_ext = 'synctex.gz run.xml bcf nav snm vrb xdv';
