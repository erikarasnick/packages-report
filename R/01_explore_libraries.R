#' ---
#' output: github_document
#' ---

suppressPackageStartupMessages(library(tidyverse))

#' Which libraries does R search for packages?

# try .libPaths(), .Library
.Library

.libPaths()

#' Installed packages

## use installed.packages() to get all installed packages
## if you like working with data frame or tibble, make it so right away!
## remember to use View(), dplyr::glimpse(), or similar to inspect

packages <- installed.packages() %>% 
  as_tibble()

## how many packages?
nrow(packages)

#' Exploring the packages

## count some things! inspiration
##   * tabulate by LibPath, Priority, or both
packages %>% count(LibPath)
packages %>% count(Priority)
packages %>% count(LibPath, Priority)

##   * what proportion need compilation?
packages %>% count(NeedsCompilation) %>% mutate(prop = n / sum(n))

##   * how break down re: version of R they were built on
packages %>% count(Built) %>% mutate(prop = n / sum(n))

#' Reflections

## reflect on ^^ and make a few notes to yourself; inspiration
##   * does the number of base + recommended packages make sense to you?
# yes
##   * how does the result of .libPaths() relate to the result of .Library?
# ??


#' Going further

## if you have time to do more ...

## is every package in .Library either base or recommended?
## study package naming style (all lower case, contains '.', etc)
## use `fields` argument to installed.packages() to get more info and use it!
# installed.packages(fields = )

