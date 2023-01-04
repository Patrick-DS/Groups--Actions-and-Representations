BOOK_FILENAME = "Groups, Actions and Representations.pdf"
TEMP_FILES_FOLDER = generated_files

pdflatex:
	pdflatex -output-directory $(TEMP_FILES_FOLDER) main.tex

move_pdf:
	cp $(TEMP_FILES_FOLDER)/main.pdf book/$(BOOK_FILENAME)

make_index:
	makeindex $(TEMP_FILES_FOLDER)/main.idx -s structure/StyleInd.ist

update_bibliography:
	cp structure/bibliography/bibliography.bib $(TEMP_FILES_FOLDER)/
	biber $(TEMP_FILES_FOLDER)/main

refresh:
	make pdflatex
	make move_pdf

compile:
	make pdflatex
	make make_index
	make update_bibliography
	make pdflatex
	make pdflatex
	make move_pdf
	
recompile:
	rm $(TEMP_FILES_FOLDER)/*
	make pdflatex
	make make_index
	make update_bibliography
	make pdflatex
	make pdflatex
	make move_pdf
	