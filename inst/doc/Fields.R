## ----message=FALSE, warning=FALSE, include=FALSE------------------------------
library(ridigbio)

## -----------------------------------------------------------------------------
record_fields <- idig_meta_fields(type = "records", subset = "raw")
rfall <- data.frame(matrix(ncol = 3, nrow = 0))

for(i in 1:length(record_fields)){
  if(length(record_fields[[i]]) == 2){
    rf <- data.frame(matrix(ncol = 3, nrow = 0))
    rf[1, 1] <-  names(record_fields[i])
    rf[1, 2] <-  (record_fields[[i]])$type
    rf[1, 3] <-  (record_fields[[i]])$fieldName
    rfall <- rbind(rfall, rf)
  }else{
   sub <- record_fields[[i]]
    for(j in 1:length(sub)){
      rf <- data.frame(matrix(ncol = 3, nrow = 0))
      rf[1, 1] <-  names(sub[j])
      rf[1, 2] <-  (sub[[j]])$type
      rf[1, 3] <-  (sub[[j]])$fieldName
      rfall <- rbind(rfall, rf)
     }
  }
}
colnames(rfall) <- c("name", "type", "fieldName")
nrow(rfall)

## -----------------------------------------------------------------------------
record_fields_index <- idig_meta_fields(type = "records", subset = "indexed")
rfalli <- data.frame(matrix(ncol = 3, nrow = 0))

  for(i in 1:length(record_fields_index)){
    if(length(record_fields_index[[i]]) == 2){
      rf <- data.frame(matrix(ncol = 3, nrow = 0))
      rf[1, 1] <-  names(record_fields_index[i])
      rf[1, 2] <-  (record_fields_index[[i]])$type
      rf[1, 3] <-  (record_fields_index[[i]])$fieldName
      rfalli <- rbind(rfalli, rf)
    }else{
     sub <- record_fields_index[[i]]
      for(j in 1:length(sub)){
        rf <- data.frame(matrix(ncol = 3, nrow = 0))
        rf[1, 1] <-  names(sub[j])
        rf[1, 2] <-  (sub[[j]])$type
        rf[1, 3] <-  (sub[[j]])$fieldName
        rfalli <- rbind(rfalli, rf)
       }
    }
  }
colnames(rfalli) <- c("name", "type", "fieldName")
nrow(rfalli)

## -----------------------------------------------------------------------------
setequal(rfall, rfalli)

## -----------------------------------------------------------------------------
rfall[238,]

## -----------------------------------------------------------------------------
rfalli[69,]

## -----------------------------------------------------------------------------
out <- idig_search_records(rq=list(scientificname="Galax urceolata"), 
                           fields = rfall$fieldName)

## -----------------------------------------------------------------------------
media_fields <- idig_meta_fields(type = "media", subset = "raw")
mfall <- data.frame(matrix(ncol = 3, nrow = 0))

for(i in 1:length(media_fields)){
    if(length(media_fields[[i]]) == 2){
      mf <- data.frame(matrix(ncol = 3, nrow = 0))
      mf[1, 1] <-  names(media_fields[i])
      mf[1, 2] <-  (media_fields[[i]])$type
      mf[1, 3] <-  (media_fields[[i]])$fieldName
      mfall <- rbind(mfall, mf)
    }else{
     sub <- media_fields[[i]]
      for(j in 1:length(sub)){
        mf <- data.frame(matrix(ncol = 3, nrow = 0))
        mf[1, 1] <-  names(sub[j])
        mf[1, 2] <-  (sub[[j]])$type
        mf[1, 3] <-  (sub[[j]])$fieldName
        mfall <- rbind(mfall, mf)
       }
    }
  }
colnames(mfall) <- c("name", "type", "fieldName")
nrow(mfall)

## -----------------------------------------------------------------------------
media_fields_index <- idig_meta_fields(type = "media", subset = "indexed")
mfalli <- data.frame(matrix(ncol = 3, nrow = 0))

for(i in 1:length(media_fields_index)){
    if(length(media_fields_index[[i]]) == 2){
      mf <- data.frame(matrix(ncol = 3, nrow = 0))
      mf[1, 1] <-  names(media_fields_index[i])
      mf[1, 2] <-  (media_fields_index[[i]])$type
      mf[1, 3] <-  (media_fields_index[[i]])$fieldName
      mfalli <- rbind(mfalli, mf)
    }else{
     sub <- media_fields_index[[i]]
      for(j in 1:length(sub)){
        mf <- data.frame(matrix(ncol = 3, nrow = 0))
        mf[1, 1] <-  names(sub[j])
        mf[1, 2] <-  (sub[[j]])$type
        mf[1, 3] <-  (sub[[j]])$fieldName
        mfalli <- rbind(mfalli, mf)
       }
    }
  }
colnames(mfalli) <- c("name", "type", "fieldName")
nrow(mfalli)

## -----------------------------------------------------------------------------
mfalli$name

## -----------------------------------------------------------------------------
out <- idig_search_media(rq=list(scientificname="Galax urceolata"), 
                           fields = mfalli$fieldName)

