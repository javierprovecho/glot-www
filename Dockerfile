FROM haskell:7
MAINTAINER javiertitan@gmail.com

COPY . /glot-www/.
WORKDIR /glot-www/
RUN apt update &&\
 apt -y install git libpq-dev &&\
 cabal sandbox init &&\
 cabal update &&\
 cabal install -j --only-dependencies --max-backjumps=-1 --reorder-goals &&\
 cabal build

CMD dist/build/glot/glot
