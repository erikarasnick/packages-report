01\_explore\_libraries.R
================
RASV5G
2020-01-27

``` r
suppressPackageStartupMessages(library(tidyverse))
```

Which libraries does R search for packages?

``` r
# try .libPaths(), .Library
.Library
```

    ## [1] "/Library/Frameworks/R.framework/Resources/library"

``` r
.libPaths()
```

    ## [1] "/Library/Frameworks/R.framework/Versions/3.6/Resources/library"

Installed packages

``` r
## use installed.packages() to get all installed packages
## if you like working with data frame or tibble, make it so right away!
## remember to use View(), dplyr::glimpse(), or similar to inspect

packages <- installed.packages() %>% 
  as_tibble()

## how many packages?
nrow(packages)
```

    ## [1] 404

Exploring the packages

``` r
## count some things! inspiration
##   * tabulate by LibPath, Priority, or both
packages %>% count(LibPath)
```

    ## # A tibble: 1 x 2
    ##   LibPath                                                            n
    ##   <chr>                                                          <int>
    ## 1 /Library/Frameworks/R.framework/Versions/3.6/Resources/library   404

``` r
packages %>% count(Priority)
```

    ## # A tibble: 3 x 2
    ##   Priority        n
    ##   <chr>       <int>
    ## 1 base           14
    ## 2 recommended    15
    ## 3 <NA>          375

``` r
packages %>% count(LibPath, Priority)
```

    ## # A tibble: 3 x 3
    ##   LibPath                                                  Priority       n
    ##   <chr>                                                    <chr>      <int>
    ## 1 /Library/Frameworks/R.framework/Versions/3.6/Resources/… base          14
    ## 2 /Library/Frameworks/R.framework/Versions/3.6/Resources/… recommend…    15
    ## 3 /Library/Frameworks/R.framework/Versions/3.6/Resources/… <NA>         375

``` r
##   * what proportion need compilation?
packages %>% count(NeedsCompilation) %>% mutate(prop = n / sum(n))
```

    ## # A tibble: 3 x 3
    ##   NeedsCompilation     n   prop
    ##   <chr>            <int>  <dbl>
    ## 1 no                 215 0.532 
    ## 2 yes                180 0.446 
    ## 3 <NA>                 9 0.0223

``` r
##   * how break down re: version of R they were built on
packages %>% count(Built) %>% mutate(prop = n / sum(n))
```

    ## # A tibble: 1 x 3
    ##   Built     n  prop
    ##   <chr> <int> <dbl>
    ## 1 3.6.0   404     1

Reflections

``` r
## reflect on ^^ and make a few notes to yourself; inspiration
##   * does the number of base + recommended packages make sense to you?
# yes
##   * how does the result of .libPaths() relate to the result of .Library?
# ??
```

Going further

``` r
## if you have time to do more ...

## is every package in .Library either base or recommended?
## study package naming style (all lower case, contains '.', etc)
## use `fields` argument to installed.packages() to get more info and use it!
# installed.packages(fields = )
```
