index.html: index.Rmd
	Rscript -e 'rmarkdown::render("index.Rmd", rmarkdown::resolve_output_format("index.Rmd"))'
