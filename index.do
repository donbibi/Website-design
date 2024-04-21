<<dd_version: 1>>     
<<dd_include: header.txt>>

# Building my website  

### Eyram Bansah, MD MPH


```
<<dd_do:nooutput>>
qui {	
		cls
		clear
		set seed 340600
		set obs 30
		gen age = (rnormal() * 15) + 57 //simulate normal distribution
		gen age_t = (rt(_N) * 15) +17 //simulate t-distribution
		hist age, ///
			fcolor(orange%40) /// simulated normal
			addplot(hist age_t, fcolor(midblue%50)) /// simulated t-distribution
			normal /// theoritical normal
			legend(on ///
				lab(1 "Sampled from Normal") ///
					lab(2 "Theoritical Normal") ///
					lab(3 "Sampled from t-distribution") ///
				)
		graph export Graph_hw4.png, replace 
}
<</dd_do>>
```

<<dd_graph>>
