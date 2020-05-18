.PHONY : clean

## Build the final report.
report.pdf: report.tex figures/temporal-histogram.png fragments/cleaning.fragment.tex
	pdflatex report.tex
	pdflatex report.tex
	mkdir -p versioned_reports
	cp report.pdf versioned_reports/game-timeline-`date | tr ' :' '_'`-`git log -1 | grep commit  | cut -d' ' -f2 |cut -c 1-5`.pdf

## A temporal histogram
figures/temporal-histogram.png: temporal-histogram.R derived_data/observations-tidy.csv
	Rscript temporal-histogram.R

## Tidy up and reformat the data data for future use.
derived_data/observations-tidy.csv fragments/cleaning.fragment.tex: remove-outliers.R preamble.R source_data/observations.json
	Rscript remove-outliers.R

clean:
	rm *.pdf
	rm figures/*
	rm fragments/*
	rm derived_data/*
