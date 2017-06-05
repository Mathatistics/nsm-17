index.html: index.Rmd
	Rscript -e 'rmarkdown::render("index.Rmd", rmarkdown::resolve_output_format("index.Rmd"))'

clean: 
	rm -rf index.html index_files index.tex

serve:
	$(MAKE) && browser-sync start --server --files index.html *.css --no-ui