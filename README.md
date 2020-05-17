Videogame Timeline Data Analysis
================================

Running the environment:

    docker build . -t example
    docker run -v `pwd`:/host -it example /bin/bash

Or, if you want to start R directly:

    docker run -v `pwd`:/host -it example R

There are also some handy aliases defined in alias.sh

    source aliases.sh
    r # starts R inside the docker container
    m # runs make
    b # runs bash inside the container

Make Targets
============

At present you can make the tidied data set like this:

    m derived_data/observations-tidy.csv

