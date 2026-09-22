# Struttura del progetto

```
libro/
├── IFA-Report-2017it.tex file principale: preambolo, metadati, \include
├── prefazione.tex        materiale iniziale (frontmatter)
├── bibliografia.bib      riferimenti bibliografici
├── capitoli/
│   ├── cap01.tex … cap09.tex
├── allegati/
│   ├── allegatoA.tex
│   └── allegatoB.tex
└── immagini/             file grafici (graphicspath già impostato)
```

## Compilazione

    latexmk -pdf IFA-Report-2017it.tex

oppure da VS Code con l'estensione LaTeX Workshop (vedi `.vscode/settings.json`).
In alternativa, tre passate manuali:

    pdflatex IFA-Report-2017it && bibtex IFA-Report-2017it && pdflatex IFA-Report-2017it && pdflatex IFA-Report-2017it

## Note operative

- I capitoli usano `\include`: ognuno parte da pagina nuova e si può
  compilare isolatamente con `\includeonly{capitoli/cap03}` nel preambolo.
- Gli allegati sono dopo `\appendix`; la numerazione diventa A, B e
  l'intestazione di capitolo è rinominata in "Allegato".
- Le etichette seguono lo schema `cap:NN`, `sec:NN-n`, `app:X`.
