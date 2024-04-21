<<dd_version: 1>>     
<<dd_include: header.txt>>

# HW4: Building my website  

## Age Distribution of Two Hypothetical Population

### Eyram Bansah, MD MPH

**Introduction**

The analysis of `age` distributions within populations is a cornerstone in demographic 
studies, enabling researchers to understand variations and underlying trends that 
might affect both social policies and economic frameworks. 
[Normal](https://en.wikipedia.org/wiki/Normal_distribution) and [t-distributions](https://en.wikipedia.org/wiki/Student%27s_t-distribution) 
are commonly used in statistics to model real-world data, where the former often 
underpins assumed symmetry in biological data, and the latter accommodates outliers 
by being more robust due to its heavier tails. This study aims to compare these two 
statistical models by applying them to simulated data representing ages in two distinct 
sample populations. Understanding the differences in these distributions can help in 
making more informed decisions when choosing statistical models for demographic analysis.

**Methods**

The study utilized [Stata 15](https://www.stata.com/stata15/) software to simulate two separate datasets representing
 age distributions for two sample populations. The simulation was performed as follows:
The Stata environment was cleared of previous data and settings, and a seed for 
random number generation was set to `340600` to ensure reproducibility of the results.
A dataset of `30` observations was generated to represent the age of individuals 
from a population modeled by a <u>normal distribution</u>. The age variable `age` was 
created by adjusting a normally distributed random variable 
(`mean` = 57, `standard deviation` = 15).
Concurrently, another age dataset for a different population was simulated 
using a <u>t-distribution</u> `age_t`, intended to capture a broader age range 
(`mean` = 17, `scale` = 15).
For both datasets, histograms were plotted to visualize the distribution of age.
 The `histograms` were color-coded for distinction, <span style="color:orange;">orange</span> for the 
<i>normal distribution</i> and <span style="color:blue;">blue</span> for the <i>t-distribution</i>.
Additionally, a theoretical normal curve was superimposed on the `histograms` 
to serve as a reference.The graphical output was configured to display the 
`histograms` side-by-side with associated legends and a title, Age distribution in two sample populations. 
This allowed direct visual comparison of the empirical data with the theoretical 
model. A footnote indicating the simulated nature of the data was also included 
in the graph.

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
			) ///
			xtitle("Age (years)") ///
			caption("Source: Simulated data")
		graph export Graph_hw4.png, replace 
}
<</dd_do>>
```
**Figure 1. Age distribution of two sample population**

<<dd_graph>>

**Results**

The `histogram` of distribution of $\text{Age, years} \sim \mathcal{N}(\mu=57,\,\sigma^{2}=225$
 revealed distinct differences between the two simulated distribution. 
The `normal distribution` appeared symmetric around the `mean age` 
of `57 years`, closely aligning with the theoretical normal curve superimposed on 
the graph. In contrast, the `t-distribution`, represented by the sample starting 
at a `mean age` of `17 years`, showed a wider spread and heavier tails, indicating 
more variability and a potential presence of outliers.

