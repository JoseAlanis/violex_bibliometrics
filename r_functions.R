clean_citations <- function(data, field, thesaurus) {
  # load packages
  require(dplyr)
  require(stringr)
  
  for (i in (1:nrow(M))) {
    
    # place holder
    new <- c()
    
    # get cited references
    old <- data[i, field]
    
    # if none skip
    if (is.na(old)) {
      next
    }
    
    # separate into single elements
    objs <- str_split(old, ';', simplify = T)
    
    for (obj in objs) {
      
      if (is.na(obj)) {
        next
      }
      
      if (str_trim(obj, side = 'both') %in% thesaurus$obj) {
        print(paste('Found:', obj))
        replacement <- as.character(thesaurus[thesaurus$obj == obj, "replacement"])
        new <- c(new, str_trim(replacement, side = 'left'))
      } else {
        new <- c(new, obj)
      }
      
    }
    
    # replace cited references that with the
    # corrected reference names
    new <- paste(new, collapse = ";")
    data[i, field] <- new
    
  }
  
  return(data)
}