# aliases to save you some typing
alias m="docker run --user `id -u` -v `pwd`:/host -it example make"
alias b="docker run --user `id -u` -v `pwd`:/host -it example /bin/bash"
alias r="docker run --user `id -u` -v `pwd`:/host -it example R"
alias rs="docker run --user `id -u` -v `pwd`:/host -it example Rscript"
