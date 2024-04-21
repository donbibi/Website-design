********************************************************************************
********************************************************************************
***************				 STATA PROGRAMMING II				****************
***************				 	  HOMEWORK 4					****************
***************				 	  20/04/2024					****************
********************************************************************************
********************************************************************************

qui {

	if 0 {//Background

		0. Stata programming inspired by Abimereki Muzaale
		1. Website design 	

		}

	if 1 {//Settings, macros, logfile
		
		cls
		clear
		set more off
		
		//system-defined constants	
		global workdir `c(pwd)'
		
		capture log close
		log using "${workdir}hw4.bansah.eyram.log", replace

		set seed 340600
		set obs 30
		
	}

	if 2 {//Variable generation

		gen age = (rnormal() * 15) + 57 //simulate normal distribution
		gen age_t = (rt(_N) * 15) +17 //simulate t-distribution
		
	}

	if 3 {//Graphical representation

		hist age, ///
			fcolor(orange%40) /// simulated normal
			addplot(hist age_t, fcolor(midblue%50)) /// simulated t-distribution
			normal /// theoritical normal
			legend(on ///
				lab(1 "Sampled from Normal") ///
					lab(2 "Theoritical Normal") ///
					lab(3 "Sampled from t-distribution") ///
					)

	}	

	if 4 {//Website Design

		
	}

}
