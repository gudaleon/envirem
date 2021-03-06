##' @title envirem
##'
##' @description Generation of bioclimatic rasters that are complementary to the WorldClim dataset.  
##' 
##' 
##' @author Pascal O. Title, Jordan B. Bemmels
##' 
##' @references \url{http://envirem.github.io}
##'
##' Title, P.O., Bemmels, J.B. 2017. ENVIREM: An expanded set of bioclimatic and topographic variables increases flexibility and improves performance of ecological niche modeling. Ecography doi: 10.1111/ecog.02880.
##' 
##' @details
##' 
##' Package: envirem\cr
##' Type: Package\cr
##' Version: 1.3\cr
##' Date: 2018-04-16\cr
##' License: GPL-2 | GPL-3\cr
##'
##' \strong{NOTE}: Temperature rasters are now assumed by default to be in degrees C. However, 
##' different input datasets have different units. For example, worldclim v1 has temperature 
##' rasters in degrees C * 10. Worldclim v2 uses degrees C. CHELSA has several options, depending 
##' on whether rasters are downloaded as floating point or integer. Therefore, there is an argument 
##' \code{tempScale} to specify the units of temperature:
##' 
##' For example:\cr
##' If using worldclim v1 data where temperature is in degrees C * 10, specify 
##' \code{tempScale = 10}.\cr
##' If using worldclim v2 where temperature is in degrees C, specify \code{tempScale = 1}.\cr
##' If using CHELSA with floating point accuracy where temperature is in degrees C, specify
##' \code{tempScale = 1}.\cr
##' If using CHELSA as integers where temperature is in degrees C * 1000, specify 
##' \code{tempScale = 1000}. \cr
##'
##' If a function does not have the \code{tempScale} argument, then the function is not sensitive
##' to the units of the input temperature rasters.
##'
##' Precipitation is in mm across both WorldClim and CHELSA, therefore no equivalent control is 
##' provided.
##' 
##' Of course, it is also perfectly acceptable to leave \code{tempScale = 1} and modify the input
##' rasters yourself. 
##'
##'
##' The main function for generating ENVIREM rasters is \code{\link{generateRasters}}. 
##' A complete tutorial of this R package can be found at \url{http://envirem.github.io}. 
##' 
##' @name envirem
##' @docType package
##' @keywords package
##'
##' @import raster RSAGA
##' @importFrom stats sd
##'
NULL
