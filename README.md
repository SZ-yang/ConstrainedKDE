---
output: github_document
---

# Purpose

`ConstrainedKDE` is an R package for performing kernel density estimation with moment constraints. It allows users to fit a kernel density estimation model, predict densities and moments, and visualize the results using constrained KDE.

- The URL to the GitHub (i.e., the source code) is: https://github.com/SZ-yang/ConstrainedKDE
- The URL to the Pkgdown webpage is: https://sz-yang.github.io/ConstrainedKDE/

# How to install

This package is called `ConstrainedKDE`. To install, run the following code (in R):

```R
library(devtools)
devtools::install_github("SZ-yang/ConstrainedKDE")



> devtools::session_info()
─ Session info ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 setting  value
 version  R version 4.4.0 (2024-04-24)
 os       macOS Big Sur 11.7.10
 system   x86_64, darwin20
 ui       RStudio
 language (EN)
 collate  en_US.UTF-8
 ctype    en_US.UTF-8
 tz       America/Los_Angeles
 date     2024-06-07
 rstudio  2023.09.0+463 Desert Sunflower (desktop)
 pandoc   3.1.1 @ /Applications/RStudio.app/Contents/Resources/app/quarto/bin/tools/ (via rmarkdown)

─ Packages ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 ! package        * version    date (UTC) lib source
   askpass          1.2.0      2023-09-03 [1] CRAN (R 4.4.0)
   brio             1.1.5      2024-04-24 [1] CRAN (R 4.4.0)
   cachem           1.0.8      2023-05-01 [1] CRAN (R 4.4.0)
   callr            3.7.6      2024-03-25 [1] CRAN (R 4.4.0)
   cli              3.6.2      2023-12-11 [1] CRAN (R 4.4.0)
   colorspace       2.1-0      2023-01-23 [1] CRAN (R 4.4.0)
   commonmark       1.9.1      2024-01-30 [1] CRAN (R 4.4.0)
 P ConstrainedKDE * 0.0.0.9000 2024-06-07 [?] load_all()
   crayon           1.5.2      2022-09-29 [1] CRAN (R 4.4.0)
   credentials      2.0.1      2023-09-06 [1] CRAN (R 4.4.0)
   curl             5.2.1      2024-03-01 [1] CRAN (R 4.4.0)
   desc             1.4.3      2023-12-10 [1] CRAN (R 4.4.0)
   devtools       * 2.4.5      2022-10-11 [1] CRAN (R 4.4.0)
   digest           0.6.35     2024-03-11 [1] CRAN (R 4.4.0)
   dotCall64        1.1-1      2023-11-28 [1] CRAN (R 4.4.0)
   dplyr            1.1.4      2023-11-17 [1] CRAN (R 4.4.0)
   ellipsis         0.3.2      2021-04-29 [1] CRAN (R 4.4.0)
   evaluate         0.23       2023-11-01 [1] CRAN (R 4.4.0)
   fansi            1.0.6      2023-12-08 [1] CRAN (R 4.4.0)
 V farver           2.1.1      2024-05-13 [1] CRAN (R 4.4.0) (on disk 2.1.2)
   fastmap          1.1.1      2023-02-24 [1] CRAN (R 4.4.0)
   fs               1.6.4      2024-04-25 [1] CRAN (R 4.4.0)
   generics         0.1.3      2022-07-05 [1] CRAN (R 4.4.0)
   gert             2.0.1      2023-12-04 [1] CRAN (R 4.4.0)
   ggplot2        * 3.5.1      2024-04-23 [1] CRAN (R 4.4.0)
   gh               1.4.1      2024-03-28 [1] CRAN (R 4.4.0)
   gitcreds         0.1.2      2022-09-08 [1] CRAN (R 4.4.0)
   glue             1.7.0      2024-01-09 [1] CRAN (R 4.4.0)
   gridExtra      * 2.3        2017-09-09 [1] CRAN (R 4.4.0)
   gtable           0.3.5      2024-04-22 [1] CRAN (R 4.4.0)
   htmltools        0.5.8.1    2024-04-04 [1] CRAN (R 4.4.0)
   htmlwidgets      1.6.4      2023-12-06 [1] CRAN (R 4.4.0)
   httpuv           1.6.15     2024-03-26 [1] CRAN (R 4.4.0)
   httr2            1.0.1      2024-04-01 [1] CRAN (R 4.4.0)
   jsonlite         1.8.8      2023-12-04 [1] CRAN (R 4.4.0)
   knitr            1.46       2024-04-06 [1] CRAN (R 4.4.0)
   labeling         0.4.3      2023-08-29 [1] CRAN (R 4.4.0)
   later            1.3.2      2023-12-06 [1] CRAN (R 4.4.0)
   lattice          0.22-6     2024-03-20 [1] CRAN (R 4.4.0)
   lifecycle        1.0.4      2023-11-07 [1] CRAN (R 4.4.0)
   magrittr         2.0.3      2022-03-30 [1] CRAN (R 4.4.0)
   MASS           * 7.3-60.2   2024-04-24 [1] local
   Matrix         * 1.7-0      2024-03-22 [1] CRAN (R 4.4.0)
   matrixStats    * 1.3.0      2024-04-11 [1] CRAN (R 4.4.0)
   memoise          2.0.1      2021-11-26 [1] CRAN (R 4.4.0)
   mime             0.12       2021-09-28 [1] CRAN (R 4.4.0)
   miniUI           0.1.1.1    2018-05-18 [1] CRAN (R 4.4.0)
   munsell          0.5.1      2024-04-01 [1] CRAN (R 4.4.0)
   openssl          2.1.2      2024-04-21 [1] CRAN (R 4.4.0)
   pillar           1.9.0      2023-03-22 [1] CRAN (R 4.4.0)
   pkgbuild         1.4.4      2024-03-17 [1] CRAN (R 4.4.0)
   pkgconfig        2.0.3      2019-09-22 [1] CRAN (R 4.4.0)
   pkgdown          2.0.9      2024-04-18 [1] CRAN (R 4.4.0)
   pkgload          1.3.4      2024-01-16 [1] CRAN (R 4.4.0)
   pracma         * 2.4.4      2023-11-10 [1] CRAN (R 4.4.0)
   prettyunits      1.2.0      2023-09-24 [1] CRAN (R 4.4.0)
   processx         3.8.4      2024-03-16 [1] CRAN (R 4.4.0)
   profvis          0.3.8      2023-05-02 [1] CRAN (R 4.4.0)
   promises         1.3.0      2024-04-05 [1] CRAN (R 4.4.0)
   ps               1.7.6      2024-01-18 [1] CRAN (R 4.4.0)
   purrr            1.0.2      2023-08-10 [1] CRAN (R 4.4.0)
   R6               2.5.1      2021-08-19 [1] CRAN (R 4.4.0)
   ragg             1.3.0      2024-03-13 [1] CRAN (R 4.4.0)
   rappdirs         0.3.3      2021-01-31 [1] CRAN (R 4.4.0)
   rcmdcheck        1.4.0      2021-09-27 [1] CRAN (R 4.4.0)
   Rcpp             1.0.12     2024-01-09 [1] CRAN (R 4.4.0)
   remotes          2.5.0      2024-03-17 [1] CRAN (R 4.4.0)
 V rlang            1.1.3      2024-06-04 [1] CRAN (R 4.4.0) (on disk 1.1.4)
   rmarkdown        2.26       2024-03-05 [1] CRAN (R 4.4.0)
   roxygen2         7.3.1      2024-01-22 [1] CRAN (R 4.4.0)
   rprojroot        2.0.4      2023-11-05 [1] CRAN (R 4.4.0)
   rstudioapi       0.16.0     2024-03-24 [1] CRAN (R 4.4.0)
   scales           1.3.0      2023-11-28 [1] CRAN (R 4.4.0)
   sessioninfo      1.2.2      2021-12-06 [1] CRAN (R 4.4.0)
   shiny            1.8.1.1    2024-04-02 [1] CRAN (R 4.4.0)
   spam             2.10-0     2023-10-23 [1] CRAN (R 4.4.0)
   sparseinv      * 0.1.3      2018-08-23 [1] CRAN (R 4.4.0)
   stringi          1.8.3      2023-12-11 [1] CRAN (R 4.4.0)
   stringr          1.5.1      2023-11-14 [1] CRAN (R 4.4.0)
   sys              3.4.2      2023-05-23 [1] CRAN (R 4.4.0)
   systemfonts      1.0.6      2024-03-07 [1] CRAN (R 4.4.0)
   testthat       * 3.2.1.1    2024-04-14 [1] CRAN (R 4.4.0)
   textshaping      0.3.7      2023-10-09 [1] CRAN (R 4.4.0)
   tibble           3.2.1      2023-03-20 [1] CRAN (R 4.4.0)
   tidyselect       1.2.1      2024-03-11 [1] CRAN (R 4.4.0)
   urlchecker       1.0.1      2021-11-30 [1] CRAN (R 4.4.0)
   usethis        * 2.2.3      2024-02-19 [1] CRAN (R 4.4.0)
   utf8             1.2.4      2023-10-22 [1] CRAN (R 4.4.0)
   UWBiost561       0.0.0.9000 2024-05-08 [1] Github (SZ-yang/UWBiost561@88cab7b)
   vctrs            0.6.5      2023-12-01 [1] CRAN (R 4.4.0)
   waldo            0.5.2      2023-11-02 [1] CRAN (R 4.4.0)
   whisker          0.4.1      2022-12-05 [1] CRAN (R 4.4.0)
   withr            3.0.0      2024-01-16 [1] CRAN (R 4.4.0)
   xfun             0.43       2024-03-25 [1] CRAN (R 4.4.0)
   xml2             1.3.6      2023-12-04 [1] CRAN (R 4.4.0)
   xopen            1.0.1      2024-04-25 [1] CRAN (R 4.4.0)
   xtable           1.8-4      2019-04-21 [1] CRAN (R 4.4.0)
   yaml             2.3.8      2023-12-11 [1] CRAN (R 4.4.0)

 [1] /Library/Frameworks/R.framework/Versions/4.4-x86_64/Resources/library

 V ── Loaded and on-disk version mismatch.
 P ── Loaded and on-disk path mismatch.
