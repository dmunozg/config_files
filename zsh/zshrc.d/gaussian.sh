#!/bin/sh

export g09root=/opt/g09
export GAUSS_SCRDIR=/tmp

export GAUSS_EXEDIR=$g09root/bsd:$g09root/private:$g09root
export GAUSS_ARCHDIR=$g09root/arch
export GMAIN=$GAUSS_EXEDIR
export LD_LIBRARY_PATH=$GAUSS_EXEDIR
export PATH=$GAUSS_EXEDIR:$PATH
export G09_BASIS=$g09_root/basis

