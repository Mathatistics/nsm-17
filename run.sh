#!/bin/bash

Rscript -e "rmarkdown::render('index.Rmd', revealjs::revealjs_presentation())"
