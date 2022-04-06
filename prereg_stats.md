Preregistration statistics
================
Joanes Grandjean

``` r
# mostly not needed now, but always useful to have in the future. 
require(tidyverse)
```

    ## Loading required package: tidyverse

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✓ ggplot2 3.3.5     ✓ purrr   0.3.4
    ## ✓ tibble  3.1.6     ✓ dplyr   1.0.8
    ## ✓ tidyr   1.2.0     ✓ stringr 1.4.0
    ## ✓ readr   2.1.2     ✓ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
require(lme4)
```

    ## Loading required package: lme4

    ## Loading required package: Matrix

    ## 
    ## Attaching package: 'Matrix'

    ## The following objects are masked from 'package:tidyr':
    ## 
    ##     expand, pack, unpack

``` r
require(multcomp)
```

    ## Loading required package: multcomp

    ## Loading required package: mvtnorm

    ## Loading required package: survival

    ## Loading required package: TH.data

    ## Loading required package: MASS

    ## 
    ## Attaching package: 'MASS'

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     select

    ## 
    ## Attaching package: 'TH.data'

    ## The following object is masked from 'package:MASS':
    ## 
    ##     geyser

The purpose of this document is to test different statistical approaches
we want to deploy to test our hypotheses. Specifically, we want to test
for differences in variance between groups within the framework a linear
mixed model.

``` r
n<-15
a<-rnorm(n,mean=0, sd=1)
b<-rnorm(n, mean=0, sd=2.5)
label<-as_factor(c(rep('a',n),rep('b',n)))

df_simple<-tibble(y=c(a,b), label=label)
```

``` r
# simple test for variance. 
var.test(y~label,df_simple)
```

    ## 
    ##  F test to compare two variances
    ## 
    ## data:  y by label
    ## F = 0.2699, num df = 14, denom df = 14, p-value = 0.01982
    ## alternative hypothesis: true ratio of variances is not equal to 1
    ## 95 percent confidence interval:
    ##  0.09061221 0.80391008
    ## sample estimates:
    ## ratio of variances 
    ##          0.2698964

``` r
#fit the model
mod<-lm(y~label, df_simple)

# extract the residuals
res_mod <- mod$residuals
res_label<- mod$model$label

# test for difference in variance in the residuals.
var.test(res_mod~res_label)
```

    ## 
    ##  F test to compare two variances
    ## 
    ## data:  res_mod by res_label
    ## F = 0.2699, num df = 14, denom df = 14, p-value = 0.01982
    ## alternative hypothesis: true ratio of variances is not equal to 1
    ## 95 percent confidence interval:
    ##  0.09061221 0.80391008
    ## sample estimates:
    ## ratio of variances 
    ##          0.2698964
