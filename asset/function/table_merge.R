library(tidyverse)
study <-
read_csv('asset/study.csv', col_types = cols()) %>% select(
Mouse_ID,
POND_Mouse_ID,
Study_Name,
Is_Wildtype,
TwoLevel_Group,
Mouse_Sex,
Timepoint,
Mouse_Age,
Mouse_Weight,
Treatment_Code,
Perfusion_Date,
Scan_Date)

strain<-read_csv('asset/scanbase_40um - Genotypes_31Jan22.csv')
study_merge<-left_join(study,strain, by = c("Study_Name" = "Study_Name", "Is_Wildtype" = "Is_Wildtype"))
write_tsv(study_merge,'asset/table/study_clean.tsv')