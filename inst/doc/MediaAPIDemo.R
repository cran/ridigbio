## ----message=FALSE------------------------------------------------------------
# Load core libraries; install these packages if you have not already
library(ridigbio)
library(tidyverse)

# Load library for making nice HTML output
library(kableExtra)

## -----------------------------------------------------------------------------
# Edit the fields (e.g. `genus`) and values (e.g. "manis") in `list()` 
# to adjust your query and the fields (e.g. `uuid`) in `fields` to adjust the
# columns returned in your results; edit the number after `limit` to adjust the
# number of records you will retrieve images for
records <- idig_search_media(rq = list(genus = "acer",
                                       country = "united states"), 
            fields = c("uuid",
                       "accessuri",
                       "rights",
                       "format",
                       "records"),
            limit = 10)

records$accessuri <- if_else(grepl("^http://", records$accessuri),
  gsub("^http://", "", records$accessuri),
  records$accessuri
)
records$accessuri <- if_else(grepl("https://mam.ansp.org", records$accessuri),
  gsub("https://mam.ansp.org", "mam.ansp.org", records$accessuri),
  records$accessuri
)
records$accessuri <- if_else(grepl("https://ibss-images.calacademy.org", records$accessuri),
  gsub("https://ibss-images.calacademy.org", "ibss-images.calacademy.org", records$accessuri),
  records$accessuri
)

## ----echo = FALSE, results = 'asis'-------------------------------------------
knitr::kable(records) %>% 
    kable_styling(bootstrap_options = 
                         c("striped", "hover", "condensed", "responsive")) %>% 
  scroll_box(width = "100%")

## -----------------------------------------------------------------------------
# Assemble a vector of iDigBio server download URLs from `records`
mediaurl_idigbio <- records %>% 
  mutate(mediaURL = paste("https://api.idigbio.org/v2/media/", uuid, sep = "")) %>% 
  select(mediaURL) %>% 
  pull()

# Assemble a vector of external server download URLs from `records`
mediaurl_external <- records$accessuri %>% 
  str_replace("\\?size=fullsize", "")

## -----------------------------------------------------------------------------
mediaurl_idigbio

## -----------------------------------------------------------------------------
mediaurl_external

## ----include=FALSE------------------------------------------------------------
exampleimgpath <- paste("jpgs_idigbio/",records$uuid[1],".jpg", sep = "")

