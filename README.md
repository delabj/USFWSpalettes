US Fish & Wildlife Service Color Palettes
================
Joshua de la Bruere
9/18/2020

# Description

Inspired by [this
tweet](https://twitter.com/margaretsiple/status/1306695097438801920)
from Dr. Margaret Siple this is a minimal package designed to add color
palettes based on the photos. This package was developed at the same
time DL Miller created [a
gist](https://gist.github.com/dill/1729bbc9ad4f915942045f96a6cfbf9d) to
allow people to use those palettes as well. This package aims to allow
users to install the functions needed to use these palettes

## What’s Inside

This package contains a few basic functions and lists.

  - `USFWS_palettes`(List of Palettes)
  - `USFWS_palette()`
  - `scale_color_USFWS()`
  - `scale_fill_USFWS()`

## Useage

``` r
library(tidyverse)
library(USFWSpalettes)

# Get a palette
USFWS_palette(5, "aurora", TRUE)
```

![](README_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

``` r
diamonds %>%
  ggplot(aes(x=cut, fill=cut))+
  geom_bar()+
  theme_minimal()+
  scale_fill_USFWS()+
  labs(title = "Count of Diamonds by Cut")
```

![](README_files/figure-gfm/unnamed-chunk-1-2.png)<!-- -->

## Palettes Included

![](README_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->![](README_files/figure-gfm/unnamed-chunk-2-2.png)<!-- -->![](README_files/figure-gfm/unnamed-chunk-2-3.png)<!-- -->![](README_files/figure-gfm/unnamed-chunk-2-4.png)<!-- -->![](README_files/figure-gfm/unnamed-chunk-2-5.png)<!-- -->
