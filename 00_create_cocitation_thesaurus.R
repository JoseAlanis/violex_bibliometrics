# title     : thesaurus for cocitation network
# objective : remove duplicate documents
# created by: Jose C. Garcia Alanis
# created on: 2021-12-27
# R version : R version 4.0.3 (2020-10-10)


# set working directory
path <- dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(path)

dat <- read.csv('./data/thesaurus/cocitation_references.txt', 
                sep = '\t', header = T)

names(dat) <- c('id', 'label', 'citations', 'link_strength')

# load necessary packages
require(dplyr)
require(tidyr)
require(stringr)

# create new variable with repetition codes for papers with the same abbreviation
thes_new <- dat %>% 
  separate(col = 'label', into = c('name', 'year', 'source'), sep = ',') %>%
  separate(col = name, into = 'name', sep = ' ') %>%
  mutate(replace.by = paste0(name, ', ',str_trim(year, 'left'))) %>%
  mutate(replace_by = ifelse((replace.by == lead(replace.by)) & (year == lead(year)), 
                             paste0(replace.by, 'a'),
                             replace.by)) %>%
  mutate(replace_by = ifelse(grepl('*a$', lag(replace_by)) & replace.by == lag(replace.by), 
                             paste0(replace.by, 'b'), 
                             replace_by)) %>%
  mutate(replace_by = ifelse(grepl('*b$', lag(replace_by)) & replace.by == lag(replace.by), 
                             paste0(replace.by, 'c'), 
                             replace_by))

thes_new <-  thes_new %>% select(replace.by, replace_by)

# replace duplicates and false positives
thes_new[thes_new$replace.by == 'zhou, 2010', 'replace_by'] <- 'zhou, 2010'
thes_new[455, 'replace_by'] <- 'sutton, 1998'
thes_new[456, 'replace_by'] <- 'sutton, 1998'

# order influential documents according to date (a = first in year, b = second in year, etc.)
# bellebaum
thes_new[36, 'replace_by'] <- 'bellebaum, 2010b'
thes_new[37, 'replace_by'] <- 'bellebaum, 2010a'

# cavanagh 
thes_new[70, 'replace_by'] <- 'cavanagh, 2014b'
thes_new[71, 'replace_by'] <- 'cavanagh, 2014a'

# corlett 
thes_new[90, 'replace_by'] <- 'corlett, 2007b'
thes_new[91, 'replace_by'] <- 'corlett, 2007a'

# corlett 
thes_new[112, 'replace_by'] <- 'delgado, 2005b'
thes_new[113, 'replace_by'] <- 'delgado, 2005a'

# friston 
thes_new[165, 'replace_by'] <- 'friston, 2009c'
thes_new[166, 'replace_by'] <- 'friston, 2009b'

thes_new[167, 'replace_by'] <- 'friston, 2010b'
thes_new[168, 'replace_by'] <- 'friston, 2010a'

# holroyd
thes_new[218, 'replace_by'] <- 'holroyd, 2004c'
thes_new[219, 'replace_by'] <- 'holroyd, 2004b'
thes_new[220, 'replace_by'] <- 'holroyd, 2004a'

# knutson
thes_new[263, 'replace_by'] <- 'knutson, 2005b'
thes_new[264, 'replace_by'] <- 'knutson, 2005a'

# kok
thes_new[265, 'replace_by'] <- 'kok, 2012b'
thes_new[266, 'replace_by'] <- 'kok, 2012a'

# kok
thes_new[341, 'replace_by'] <- 'nieuwenhuis, 2005b'
thes_new[342, 'replace_by'] <- 'nieuwenhuis, 2005a'

# o'doherty
thes_new[352, 'replace_by'] <- "o'doherty, 2003b"
thes_new[355, 'replace_by'] <- "o'doherty, 2003a"
thes_new[353, 'replace_by'] <- "o'doherty, 2004a"
thes_new[356, 'replace_by'] <- "o'doherty, 2004b"

# wolfram schultz
thes_new[422, 'replace_by'] <- 'schultz, 1997b'
thes_new[423, 'replace_by'] <- 'schultz, 1997a'

# summerfield
thes_new[450, 'replace_by'] <- 'summerfield, 2008b'
thes_new[451, 'replace_by'] <- 'summerfield, 2008a'

thes_out <- data.frame(label = dat$label, replace_by = thes_new$replace_by)
thes_out$id <- 1:nrow(thes_out)
names(thes_out) <- c('label', 'replace by', 'id')
thes_out <- thes_out %>% 
  group_by(id) %>%
  mutate(`replace by` = 
           paste0(str_split(`replace by`, pattern = ' ', simplify = T)[1], ' (', str_split(`replace by`, pattern = ' ', simplify = T)[2], ')')) %>% 
  mutate(`replace by` = str_remove(`replace by`, ',')) %>%
  ungroup() %>%
  select(label, `replace by`)

write.table(thes_out, './data/thesaurus/clean_citations_10_docs_short.txt',
            row.names = F, sep = '\t', quote = F)
