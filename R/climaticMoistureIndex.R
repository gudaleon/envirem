##' @title Climatic Moisture Index
##'
##' @description Generate climatic moisture index.
##'
##' @param annualPrecip rasterLayer of annual precipitation

##' @param PET rasterLayer of annual potential evapotranspiration
##'
##' @details \code{P/PET - 1} when \code{P < PET} \cr
##' \code{1 - PET/P} when \code{P >= PET}
##'
##' @return rasterLayer ranging from -1 to +1.
##'
##' @references
##' Willmott, C. & Feddema, J. (1992). A More Rational Climatic Moisture Index. 
##' \emph{The Professional Geographer}, \strong{44}, 84-88.
##'
##' Vörösmarty, C.J., Douglas, E.M., Green, P.A. & Revenga, C. (2005). Geospatial 
##' Indicators of Emerging Water Stress: An Application to Africa. 
##' \emph{AMBIO: A Journal of the Human Environment}, \strong{34}, 230-236.
##'
##' @author Pascal Title
##'
##'
##' @examples
##' \donttest{
##' # Find example rasters
##' rasterFiles <- list.files(system.file('extdata', package='envirem'), full.names=TRUE)
##' env <- stack(rasterFiles)
##'
##' # identify the appropriate layers
##' meantemp <- grep('mean', names(env), value=TRUE)
##' solar <- grep('solrad', names(env), value=TRUE)
##' maxtemp <- grep('tmax', names(env), value=TRUE)
##' mintemp <- grep('tmin', names(env), value=TRUE)
##' 
##' # read them in as rasterStacks
##' meantemp <- stack(env[[meantemp]])
##' solar <- stack(env[[solar]])
##' maxtemp <- stack(env[[maxtemp]])
##' mintemp <- stack(env[[mintemp]])
##' tempRange <- abs(maxtemp - mintemp)
##' 
##' # get monthly PET
##' pet <- monthlyPET(meantemp, solar, tempRange)
##' 
##' # get mean annual PET
##' annualPET <- sum(pet)
##'
##' climaticMoistureIndex(env[['bio_12']], annualPET)
##' }
##' @export


#climatic moisture index
## cmi = (P / PET) - 1 when P < PET
## cmi = 1 - (PET / P) when P >= PET
### where P = annual precipitation, PET = potential evapotranspiration

climaticMoistureIndex <- function(annualPrecip, PET) {
	
	ind <- annualPrecip < PET
	cmi <- raster::raster(ext = raster::extent(annualPrecip), resolution = raster::res(annualPrecip))
	cmi[ind == 1] <- (annualPrecip[ind == 1] / PET[ind == 1]) - 1
	cmi[ind == 0] <- 1 - (PET[ind == 0] / annualPrecip[ind == 0])

	names(cmi) <- 'climaticMoistureIndex'
	
	return(cmi)
}

