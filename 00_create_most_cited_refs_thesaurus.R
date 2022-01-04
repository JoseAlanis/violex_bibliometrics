# title     : thesaurus for most cited references
# objective : remove duplicate documents
# created by: Jose C. Garcia Alanis
# created on: 2021-12-27
# R version : R version 4.0.3 (2020-10-10)

# set working directory
path <- dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(path)

# get the data
load('./data/data-2021-01-04_filtered.RData')

# set up thesaurus
thesaurus <- list(
  `GEHRING WJ, 2002, SCIENCE, V295, P2279, DOI 10.1126/SCIENCE.1066893` = 
    c('GEHRING W. J., 2002, SCIENCE, V14, P593'),
  `HOLROYD CB, 2002, PSYCHOL REV, V109, P679, DOI 10.1037/0033-295X.109.4.679` = 
    c('HOLROYD CB, 2002, PSYCHOL REV, V109, P679, DOI [10.1037//0033-295X.109.4.679, 10.1037/0033-295X.109.4.679]',
      'HOLROYD CB, NEURAL BASI IN PRESS'),
  `RESCORLA RA, 1972, CLASSICAL CONDITION, P64, DOI DOI 10.1101/GR.110528.110` = 
    c('RESCORLA R. A., 1972, CLASSICAL CONDITION, P64, DOI DOI 10.1101/GR.110528.110',
      'RESCORLA R, 1972, CLASSICAL CONDITIONI, V2',
      'RESCORLA RA, 1972, CLASSICAL CONDITIONI'),
  `SUTTON RS, 1998, REINFORCEMENT LEARNING: AN INTRODUCTION` =
    c('SUTTON R., 1998, REINFORCEMENT LEARNI',
      'SUTTON R.S., 1998, REINFORCEMENT LEARNI, V1',
      'SUTTON R. S., 1998, INTRO REINFORCEMENT',
      'SUTTON R, 1998, INTRO REINFORCEMENT, V135',
      'SUTTON R. S., 1998, REINFORCEMENT LEARNI, DOI [10.1109/TNN.1998.712192, DOI 10.1109/TNN.1998.712192]',
      'SUTTON R. S., 1998, REINFORCEMENT LEARNI, V9',
      'SUTTON RS, 1998, REINFORCEMENT LEARNI, P18'),
  `O'DOHERTY JP, 2004, SCIENCE, V304, P452, DOI 10.1126/SCIENCE.1094285` = 
    c("O'DOHERTY J, 2004, SCIENCE, V304, P452, DOI 10.1126/SCIENCE.1094285"))

# rename columns
thesaurus <- stack(thesaurus)
names(thesaurus) <- c('obj', 'replacement')

# save thesaurus
write.table(thesaurus,
            './data/thesaurus/most_cited_refs_thesaurus.tsv', sep = '\t',
            row.names = F)
