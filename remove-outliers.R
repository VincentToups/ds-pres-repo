library(dplyr);
library(tidyr);
library(rjson);

source("preamble.R");

## Some remarks:
## A typical step in a data science process has
## Inputs and Outputs.

## An input:
raw_observations <- read_json_from_file(file="source_data/observations.json");

observations <- tibble(year=raw_observations$year %>% as.numeric(),
               year_name=raw_observations$yearName %>% as.character(),
               game=raw_observations$game %>% as.character(),
               info=raw_observations$info %>% as.character());

dir.create("derived_data/", showWarnings=FALSE);

n_before_cleaning <- nrow(observations);

observations_tidy <- observations %>%
    filter(year >= -12000 & year <= 12000);

n_after <- nrow(observations_tidy);

## An output:
write_table_to_file(observations_tidy,
            file="derived_data/observations-tidy.csv",
            options=list(row.names=FALSE,sep=","));

## Another output:
dir.create("fragments",showWarnings=FALSE);
write_text_to_file("fragments/cleaning.fragment.tex",
                   "Before cleaning there were %d rows. Throwing away dates in excess of 12000 BC or AD resulted in keeping just %d rows.", n_before_cleaning, n_after);

