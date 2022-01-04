# title     : thesaurus for trend topics
# objective : remove duplicates and ambiguous words
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
  ` ` = 
    c('ACTIVATION',
      'ASSOCIATIONS',
      'BEHAVIOR',
      'BEHAVIORS',
      'BEHAVIOUR',
      'BEHAVIOURS',
      'BRAIN',
      'BRAIN RESPONSES',
      'BRAIN-RESPONSES',
      'BRAIN ACTIVITY',
      'CATEGORIES',
      'COGNITIVE',
      'COMPONENT', 
      'COMPONENTS', 
      'COMPUTATIONS',
      'CONSEQUENCES',
      'CONSTRAINTS',
      'CORTEX',
      'DECISIONS',
      'DETERMINANTS',
      'DYNAMIC',
      'DYNAMICS',
      'ENHANCEMENT',
      'EXPRESSION',
      'FRAMEWORK',
      'FOLLOW UP',
      'FOLLOW-UP',
      'FUNCTIONAL ANATOMY',
      'FUNCTIONAL-ANATOMY',
      'FUNCTIONAL NEUROANATOMY',
      'FUNCTIONAL-NEUROANATOMY',
      'FUTURE',
      'HUMAN',
      'HUMANS',
      'HUMAN BRAIN',
      'IMPACT',
      'INDIVIDUALS',
      'INFORMATION',
      'MECHANISMS',
      'MEDIAL',
      'METAANALYSIS',
      'META ANALYSIS',
      'META-ANALYSIS',
      'MODEL',
      'MODELS',
      'MODULATION',
      'MOTOR',
      'NEGATIVITY',
      'NETWORK MODEL',
      'NEURAL',
      'NEURAL MECHANISMS',
      'NEURAL-MECHANISMS',
      'NEURAL RESPONSES',
      'NEURAL-RESPONSES',
      'NEURAL SYSTEM',
      'NEURAL-SYSTEM',
      'NEURONAL-ACTIVITY',
      'NEURONS',
      'NUCLEUS',
      'PATTERNS',
      'PEOPLE',
      'PIGEONS',
      'POSITIVITY',
      'POTENTIALS',
      'PREDICTORS',
      'PREFRONTAL',
      'QUESTIONNAIRE',
      'SCALE',
      'SEQUENCES',
      'SIGNALS',
      'STIMULUS',
      'STIMULI',
      'SYMPTOM',
      'SYMPTOMS',
      'SYSTEM',
      'SYSTEMS',
      'TASK',
      'TASKS',
      'TEST',
      'TESTS',
      'TIME',
      'THERAPY',
      'WORDS',
      'VALIDITY'),
  `ACC` = 
    c('ANTERIOR CINGULATE CORTEX',
      'ANTERIOR-CINGULATE CORTEX',
      'ANTERIOR-CINGULATE-CORTEX',
      'ANTERIOR CINGULATE',
      'ANTERIOR-CINGULATE'),
  `ACCUMBENS` = 
    c('NUCLEUS-ACCUMBENS', 
      'NUCLEUS-ACCUMBENS'),
  `ADAPTATION` = 
    c('ADAPTION'),
  `ADJUSTMENT` = 
    c('ADJUSTMENTS'),
  `ADOLESCENT` = 
    c('ADOLESCENTS'),
  `ADULT` = 
    c('ADULTS'),
  `ALZHEIMERS` = 
    c('ALZHEIMERS-DISEASE'),
  `AMYGDALA` = c('BASOLATERAL-AMYGDALA',
                 'BASOLATERAL AMYGDALA'),
  `ANTECEDENT` = c('ANTECEDENTS'),
  `ANTISOCIAL BEHAVIOR` = 
    c('ANTISOCIAL-BEHAVIOR'),
  `ATTITUDE CHANGE` = c('ATTITUDE-CHANGE'),
  `ANXIETY` = c('ANXIETY DISORDERS'),
  `ATTITUDE` = c('ATTITUDES'),
  `ATTRIBUTION` = c('ATTRIBUTIONS'),
  `BIOGRAPHICAL MEMORY` = c('AUTOBIOGRAPHICAL MEMORY'),
  `BOY` = c('BOYS'),
  `DISORDER` = c('DISORDERS'),
  `CBT` =
    c('COGNITIVE BEHAVIORAL THERAPY',
      'COGNITIVE-BEHAVIORAL THERAPY',
      'COGNITIVE-BEHAVIORAL-THERAPY',
      'COGNITIVE BEHAVIOURAL THERAPY',
      'COGNITIVE-BEHAVIOURAL THERAPY',
      'COGNITIVE-BEHAVIOURAL-THERAPY'),
  `CHILD` = c('CHILDREN'),
  `COUPLE` = c('COUPLES'),
  `COLUMBA LIVIA` = c('COLUMBA-LIVIA'),
  `CONDUCT PROBLEM` = c('CONDUCT PROBLEMS',
                        'CONDUCT-PROBLEMS'),
  `DEPRESSION` = 
    c('MAJOR DEPRESSION',
      'MAJOR-DEPRESSION'),
  `DECISION MAKING` = c('DECISION-MAKING'),
  `DEFICIT` = c('DEFICITS'),
  `DOPAMINE` = 
    c('DOPAMINE NEURON',
      'DOPAMINE NEURONS',
      'DOPAMINE NEURONS ENCODE',
      'DOPAMINE NEURONS PREDICT',
      'MIDBRAIN DOPAMINE NEURONS',
      'MIDBRAIN-DOPAMINE NEURONS',
      'MIDBRAIN-DOPAMINE-NEURONS'),
  `ERP` = c('BRAIN POTENTIALS',
            'BRAIN-POTENTIALS',
            'EVENT RELATED POTENTIALS', 
            'EVENT-RELATED POTENTIALS',
            'EVENT-RELATED-POTENTIALS'),
  `ERROR DETECTION` = c('ERROR-DETECTION'),
  `ERROR` = c('ERRORS'),
  `ERN` = c('ERROR RELATED NEGATIVITY',
            'ERROR-RELATED NEGATIVITY',
            'ERROR-RELATED-NEGATIVITY'),
  `EXPECTATION` = 
    c('EXPECTANCY', 
      'EXPECTATIONS'),
  `EXPECTATION VIOLATION` = 
    c('EXPECTANCY VIOLATION',
      'EXPECTANCY VIOLATIONS',
      'VIOLATED EXPECTATION',
      'VIOLATED EXPECTATIONS'),
  `EXPOSURE` = c('EXPOSURE THERAPY'),
  `EYE MOVEMENT` = 
    c('EYE MOVEMENTS',
      'EYE-MOVEMENTS'),
  `FRN` = c('FEEDBACK RELATED NEGATIVITY',
            'FEEDBACK-RELATED NEGATIVITY',
            'FEEDBACK-RELATED-NEGATIVITY'),
  `FEAR` = c('CONDITIONED FEAR'),
  `FREE ENERGY` = c('FREE-ENERGY'),
  `FRONTAL CORTEX` = c('FRONTAL-CORTEX'),
  `FMRI` = c('EVENT-RELATED FMRI'),
  `GENDER` = c('GENDER DIFFERENCES',
               'GENDER-DIFFERENCES',
               'SEX DIFFERENCES',
               'SEX-DIFFERENCES'),
  `INDIVIDUAL DIFFERENCE` = 
    c('INDIVIDUAL DIFFERENCES',
      'INDIVIDUAL-DIFFERENCES'),
  `INFANT` = c('INFANTS',
               'YOUNG INFANTS'),
  `INHIBITION` = c('INHIBITORY'),
  `INTERNAL MODEL` = c('INTERNAL MODELS'),
  `RESPONSE INHIBITION` = c('RESPONSE-INHIBITION'),
  `JUDGMENT` = 
    c('JUDGEMENT', 'JUDGMENTS', 'JUDGEMENTS'),
  `LANGUAGE` = c('SPEECH'),
  `LOCUS COERULEUS` = c('LOCUS-COERULEUS'),
    c('MOTHERS'),
  `LTM` = 
    c('LONG TERM MEMORY',
      'LONG-TERM MEMORY',
      'LONG-TERM-MEMORY'),
  `MFC` = c('MEDIAL FRONTAL CORTEX',
            'MEDIAL-FRONTAL CORTEX',
            'MEDIAL FRONTAL-CORTEX',
            'MEDIAL-FRONTAL-CORTEX',
            'MEDIAL PREFRONTAL CORTEX'),
  `MMM` = c('MISMATCH-NEGATIVITY',
            'MISMATCH NEGATIVITY',
            'MISMATCH NEGATIVITY MMN'),
    c('MOTHERS'),
  `MENTAL HEALTH` = 
    c('MENTAL-HEALTH'),
  `MOTHER` = 
    c('MOTHERS'),
  `OCD` = 
    c('OBSESSIVE COMPULSIVE DISORDER',
      'OBSESSIVE-COMPULSIVE DISORDER',
      'OBSESSIVE-COMPULSIVE-DISORDER'),
  `OFC` = 
    c('ORBITOFRONTAL CORTEX',
      'ORBITOFRONTAL-CORTEX',
      'ORBITO-FRONTAL-CORTEX'),
  `OLD ADULT` = 
    c('OLDER-ADULTS',
      'OLDER ADULTS'),
  `OUTCOME` = 
    c('OUTCOMES'),
  `PARKINSONS` = 
    c('PARKINSONS-DISEASE'),
  `PERCEPTION` = 
    c('PERCEPTIONS'),
  `PFC` = 
    c('PREFRONTAL CORTEX',
      'PREFRONTAL-CORTEX'),
  `PREDICTION ERROR` = 
    c('PREDICTION-ERROR',
      'PREDICTION ERRORS',
      'PREDICTION-ERRORS',
      'REWARD PREDICTION ERROR',
      'REWARD PREDICTION ERRORS'),
  `PROTEIN SYNTHESIS` = 
    c('PROTEIN-SYNTHESIS'),
  `PTSD` = 
    c('POSTTRAUMATIC-STRESS-DISORDER',
      'POSTTRAUMATIC-STRESS DISORDER',
      'POSTTRAUMATIC STRESS-DISORDER',
      'POSTTRAUMATIC STRESS DISORDER'),
  `RECALL` = c('FREE RECALL',
               'FREE-RECALL'),
  `RISK FACTOR` = c('RISK FACTORS',
                    'RISK-FACTORS'),
  `RESPONSE` = 
    c('RESPONSES'),
  `REPRESENTATION` = 
    c('REPRESENTATIONS'),
  `SELF REGULATION` = 
    c('SELF-REGULATION'),
  `SELF EFFICACY` = 
    c('SELF-EFFICACY'),
  `SELF ESTEEM` = 
    c('SELF-ESTEEM'),
  `STM` = 
    c('SHORT TERM MEMORY',
      'SHORT-TERM MEMORY',
      'SHORT-TERM-MEMORY'),
  `STEREOTYPE` =
    c('STEREOTYPES'),
  `STRATEGY` =
    c('STRATEGIES'),
  `STUDENT` = 
    c('STUDENTS'),
  `SUBSTANCE USE` = 
    c('DRUG USE',
      'DRUG-USE',
      'DRUG DEPENDENCE',
      'DRUG-DEPENDENCE',
      'SUBSTANCE ABUSE',
      'SUBSTANCE-ABUSE',
      'SUBSTANCE DEPENDENCE',
      'SUBSTANCE-DEPENDENCE'),
  `WORKING MEMORY` = c('WORKING-MEMORY'),
  `VISUAL ATTENTION` = c('VISUAL-ATTENTION'),
  `VTA` = c('VENTRAL-TEGMENTAL-AREA',
            'VENTRAL TEGMENTAL AREA')
  )

# rename columns
thesaurus <- stack(thesaurus)
names(thesaurus) <- c('obj', 'replacement')

# save thesaurus
write.table(thesaurus, 
            './data/thesaurus/trend_topics_thesaurus.tsv', sep = '\t',
            row.names = F)

