report.html: report.Rmd code/f75_code2_render.R analysis
	Rscript code/f75_code2_render.R

analysis:
	Rscript code/caregiver_analysis.r
	Rscript code/child_muac_recovery.R
	Rscript code/f75_code1.R
	Rscript code/muac_arm_analysis.R


.PHONY: clean
clean:
	rm -f output/*.rds 
	rm -f report.html
	rm -f output/*.csv
	rm -f output/*.png
