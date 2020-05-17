library(tidyverse);
library(ggplot2);
source("preamble.R");

data <- read_csv_from_file("./derived_data/observations-tidy.csv");

p <- ggplot(data,aes(year)) + geom_histogram(bins=1000);
dir.create("./figures/",showWarnings=FALSE);

ggsave_logged("./figures/temporal-histogram.png", p);

