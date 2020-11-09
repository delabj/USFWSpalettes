#' A List of All Palettes Used
#'
#' @description A list that contains all palettes used in this package
#'
#' @export
USFWS_palettes <- list(
dolly =   c("#97C0B0", "#899B71", "#979048", "#71767A", "#D07F6E"),
sockeye = c("#537B9E", "#C5C6CB", "#988421", "#82816C", "#282D33"),
coaster = c("#98755A", "#5D6265", "#6A7897", "#CAB886", "#DD655C"),
aurora =  c("#222423", "#7F6C21", "#8D5153", "#7D4763", "#685074"),
florida = c("#050400", "#675B45", "#3E3526", "#988769", "#D2C398")
)


#' A Palette Generator
#'
#' @description This function creates palettes that were created from photos posted by the US Fish And Wildlife Service's Instagram
#'
#' @param n Number of colors
#' @param name Name of palette. See details for options
#' @param discrete Boolean value TRUE if discrete FALSE for continuous
#'
#' @md
#' @details
#' Valid palettes include
#' + dolly
#' + sockeye
#' + coaster
#' + aurora
#' + florida
#'
#' @export
USFWS_palette <- function(n=5, name="dolly", discrete = TRUE){

  pal <- USFWS_palettes[[name]]
  if(is.null(pal)){
    stop(paste0("Palette: " , name, " does not exsist"))
  }

  if(discrete && n > length(pal)){
    stop("More colors requested than are in palette")
  }

  if(discrete){
    out <- colorRampPalette(pal)(n)
  }
  else{
    pal[1:n]
  }
  structure(out, class = "palette", name = name)

}


#' @export
#'
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}

