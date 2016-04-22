#!/bin/bash

V_R=$1

V_ADA=$(cat ./OncoSimulR/DESCRIPTION | grep Version | cut -d' ' -f2)

rm OncoSimulR_$V_ADA.tar.gz

rm ./OncoSimulR/Rplots.pdf
rm ./OncoSimulR/.Rhistory
rm ./OncoSimulR/*~
rm ./OncoSimulR/inst/*~
rm ./OncoSimulR/man/*~
rm ./OncoSimulR/man/Rplots.pdf
rm ./OncoSimulR/man/.Rhistory
rm ./OncoSimulR/tests/*~
rm ./OncoSimulR/tests/Rplots.pdf
rm ./OncoSimulR/tests/.Rhistory
rm ./OncoSimulR/data/*~
rm ./OncoSimulR/data/Rplots.pdf
rm ./OncoSimulR/data/.Rhistory
rm ./OncoSimulR/tests/testthat/*~
rm ./OncoSimulR/tests/testthat/Rplots.pdf
rm ./OncoSimulR/tests/testthat/.Rhistory
rm ./OncoSimulR/tests/manual/*~
rm ./OncoSimulR/tests/manual/Rplots.pdf
rm ./OncoSimulR/tests/manual/.Rhistory
rm ./OncoSimulR/R/*~
rm ./OncoSimulR/R/.Rhistory
rm ./OncoSimulR/R/Rplots.pdf
rm ./OncoSimulR/vignettes/*~
rm ./OncoSimulR/vignettes/Rplots.pdf
rm ./OncoSimulR/vignettes/.Rhistory
rm ./OncoSimulR/src/*.so
rm ./OncoSimulR/src/*~
rm ./OncoSimulR/src/*.o
rm ./OncoSimulR/src/OncoSimulR.so
rm ./OncoSimulR/src/OncoSimul.o
rm ./OncoSimulR/src/OncoSimulR_init.o
rm ./OncoSimulR/src/symbols.rds
rm /OncoSimulR.Rcheck/* -r -f
rm ./OncoSimulR.Rcheck/* -r -f
# rm ./OncoSimulR/inst/doc/auto/*
# rmdir ./OncoSimulR/inst/doc/auto
rm ./OncoSimulR/vignettes/auto/*
rmdir ./OncoSimulR/vignettes/auto
rm ./OncoSimulR/vignettes/figure/*
rmdir ./OncoSimulR/vignettes/figure
rm ./OncoSimulR/vignettes/*.bbl
rm ./OncoSimulR/vignettes/*.aux
rm ./OncoSimulR/vignettes/*.toc
rm ./OncoSimulR/vignettes/*.tex
rm ./OncoSimulR/vignettes/*.pdf
rm ./OncoSimulR/vignettes/*.log
rm ./OncoSimulR/vignettes/*.out
rm ./OncoSimulR/vignettes/*.blg
rm ./OncoSimulR/vignettes/*.synctex.*

# echo " ************************************** "
# echo " **********   R CMD build   *********** "
# echo ""
# time $V_R  CMD build --keep-empty-dirs OncoSimulR
# echo " "
# echo " =======      done R CMD build   ======= "
# echo " "
# ## time $V_R CMD build --keep-empty-dirs --resave-data OncoSimulR
# echo " ************************************** "
# echo " *********     R CMD check   ********** "
# echo " "
# time $V_R  CMD check --no-vignettes --timings OncoSimulR_$V_ADA.tar.gz
# echo " "
# echo " =======      done R CMD check   =======  "
# echo " "
# ## time $V_R CMD check --as-cran --no-vignettes --timings OncoSimulR_$V_ADA.tar.gz
# echo " ******************************************* "
# echo " *******      long manual tests ************ "
# $V_R  CMD INSTALL --install-tests OncoSimulR_$V_ADA.tar.gz
# time $V_R -e 'library(OncoSimulR); library(testthat); library(gtools); library(smatr); test_dir("./OncoSimulR/tests/manual/")'
# echo " "
# echo " =======     done long manual tests   =======     "
# echo " "

echo " ************************************** "
echo " **********   R CMD build --vanilla  *********** "
echo ""
time $V_R --vanilla CMD build --no-resave-data --keep-empty-dirs OncoSimulR
echo " "
echo " =======      done R CMD build --vanilla  ======= "
echo " "
## time $V_R CMD build --keep-empty-dirs --resave-data OncoSimulR
echo " ************************************** "
echo " *********     R CMD check --vanilla  ********** "
echo " "
time $V_R --vanilla CMD check --no-vignettes --timings OncoSimulR_$V_ADA.tar.gz
echo " "
echo " =======      done R CMD check --vanilla  =======  "
echo " "
echo " =======  installing with tests "
$V_R --vanilla  CMD INSTALL --install-tests OncoSimulR_$V_ADA.tar.gz

## No, these tests take several hours and obscure previous output.
## Run them with the appropriate script (test-manual-continuously.R)

# ## time $V_R CMD check --as-cran --no-vignettes --timings OncoSimulR_$V_ADA.tar.gz
# echo " ******************************************* "
# echo " *******      long manual tests  --vanilla ************ "
# $V_R  CMD INSTALL --install-tests OncoSimulR_$V_ADA.tar.gz
# echo " =======     done long manual tests  --vanilla =======     "
# echo " "




# echo " ************************************** "
# echo " **********   R CMD build   *********** "
# echo ""
# time $V_R  CMD build --keep-empty-dirs OncoSimulR
# echo " "
# echo " =======      done R CMD build   ======= "
# echo " "
# ## time $V_R CMD build --keep-empty-dirs --resave-data OncoSimulR
# echo " ************************************** "
# echo " *********     R CMD check   ********** "
# echo " "
# time $V_R  CMD check --no-vignettes --timings OncoSimulR_$V_ADA.tar.gz
# echo " "
# echo " =======      done R CMD check   =======  "
# echo " "
# ## time $V_R CMD check --as-cran --no-vignettes --timings OncoSimulR_$V_ADA.tar.gz
# echo " ******************************************* "
# echo " *******      long manual tests ************ "
# $V_R  CMD INSTALL --install-tests OncoSimulR_$V_ADA.tar.gz
# time $V_R -e 'library(OncoSimulR); library(testthat); library(gtools); library(smatr); test_dir("./OncoSimulR/tests/manual/")'
# echo " "
# echo " =======     done long manual tests   =======     "





## --force-multiarch in windoze?


## To do it the Hadley way
## Rscript --vanilla -e 'library(devtools); devtools::check("OncoSimulR", document = FALSE)'

## But: I set document to FALSE, as it insists on roxygen.  And the above
## will CHANGE files if it deems appropriate (e.g., RcppExports) without
## asking you. However, it can point out things that I miss with the
## BUILD and check. So do it in a tmp directory or git checkout changes.
