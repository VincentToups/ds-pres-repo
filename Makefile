## Tidy up and reformat the data data for future use.
derived_data/observations-tidy.csv fragments/cleaning.fragment.tex: remove-outliers.R preamble.R source_data/observations.json
	Rscript remove-outliers.R
