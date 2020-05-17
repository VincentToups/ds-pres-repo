FROM rocker/tidyverse
MAINTAINER Vincent Toups "toups@unc.edu"
COPY deps.R /deps.R
RUN Rscript deps.R
RUN apt update && apt-get install -y texlive*
WORKDIR /host
CMD /bin/bash
