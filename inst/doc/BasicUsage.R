## ----eval=FALSE, include=TRUE-------------------------------------------------
#  install.packages("ridigbio")

## ----message=FALSE, warning=FALSE---------------------------------------------
library(ridigbio) 

## -----------------------------------------------------------------------------
galax_records <- idig_search_records(rq=list(scientificname="Galax urceolata"))

## -----------------------------------------------------------------------------
colnames(galax_records)

## -----------------------------------------------------------------------------
diapensiaceae_records <- idig_search_records(rq=list(family="Diapensiaceae"), limit=1000)

## -----------------------------------------------------------------------------
rq_input <- list("scientificname"=list("type"="exists"),
                 "family"="Diapensiaceae", 
                 geopoint=list(
                   type="geo_bounding_box",
                   top_left=list(lon = -98.16, lat = 48.92),
                   bottom_right=list(lon = -64.02, lat = 23.06)
                   )
                 )

## -----------------------------------------------------------------------------
diapensiaceae_records_USA <- idig_search_records(rq_input, limit=1000)

## -----------------------------------------------------------------------------
galax_media <- idig_search_media(rq=list(scientificname="Galax urceolata"))

## -----------------------------------------------------------------------------
colnames(galax_media)

## -----------------------------------------------------------------------------
galax_media2 <- idig_search_media(rq=list(scientificname="Galax urceolata"),
                                  mq=list("data.ac:accessURI"=list("type"="exists")))

