library(tidyverse)
library(rjson);

## Formatted output to the standard out
outf <- function(...){
    write(sprintf(...),file=stdout());
}

## Load a JSON file and let us know about it
read_json_from_file <- function(filename){
    outf("input: %s", filename);
    fromJSON(file=filename);
}

## Write a table to a file and let us know about it.
write_table_to_file <- function(data, filename, options=list()){
    outf("output: %s", filename);
    args <- append(list(data,file=filename), options);
    do.call(write.table, args);
}

read_csv_from_file <- function(filename){
    outf("input: %s", filename);
    read_csv(filename);
}

ggsave_logged <- function(filename, plot, options=list()){
    outf("output: %s", filename);
    do.call(ggsave, append(list(filename, plot), options));
}

write_text_to_file <- function(filename, ...){
    outf("output: %s", filename);
    write(sprintf(...),file=filename);
}
