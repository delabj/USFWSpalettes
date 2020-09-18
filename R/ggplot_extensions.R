#' Retrieve USFWS Palettes
#'
#' @description
#' Easily retrieve various palettes from the USFWS collection.

get_USFWS_palettes <- function(palette = "dolly", reverse = FALSE, ...) {
  pal <- USFWS_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}


#' Change color to one of USFWS's palettes
#'
#' @description Custom color scale to use the USFWS palettes.
#' @usage get_USFWS_palettes(palette="main", reverse=  F, ...)
#'
#' @param palette Name of the palette (dolly, sockeye, coaster, aurora, florida)
#' @param reverse Boolean: should the palette be reversed
#'
#' @examples
#' library(tidyverse)
#' library(USFWSpalettes)
#'diamonds %>%
#'  ggplot(aes(x=cut, fill=cut))+
#'  geom_bar()+
#'  theme_minimal()+
#'  scale_fill_USFWS()
#'
#'
#' @export
scale_color_USFWS <- function(palette = 'dolly', discrete= TRUE, reverse = FALSE, ...){
  pal <- get_USFWS_palettes(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("USFWS", palette), palette = pal, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Change fill to one of USFWS's palettes
#'
#' @description Custom color scale to use the USFWS palettes.
#' @usage get_USFWS_palettes(palette="main", reverse=  F, ...)
#'
#' @param palette Name of the palette (dolly, sockeye, coaster, aurora, florida)
#' @param reverse Boolean: should the palette be reversed
#' @export
scale_fill_USFWS <- function(palette = 'dolly', discrete= TRUE, reverse = FALSE, ...){
  pal <- get_USFWS_palettes(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("USFWS", palette), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}
