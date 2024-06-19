# make csv mapping of occ1950 => occscore 
# alex albright
# 2024-06-19

library(vroom)
library(janitor)
library(tidyverse)

# go to ipums: https://usa.ipums.org/usa-action/variables/group
# download extracts with only occ1950 and occscore variables for full count 1910, 1920, 1930, 1940
# save them in ipums directory as censusYEAR.csv.gz

# subset to distinct pairings of occ1950 and occscore for each decade
occ1950_occscore_1910<-vroom("ipums/census1910.csv.gz", delim = ",")%>%
  clean_names()%>%
  select(occ1950, occscore)%>%distinct()

occ1950_occscore_1920<-vroom("ipums/census1920.csv.gz", delim = ",")%>%
  clean_names()%>%
  select(occ1950, occscore)%>%distinct()

occ1950_occscore_1930<-vroom("ipums/census1930.csv.gz", delim = ",")%>%
  clean_names()%>%
  select(occ1950, occscore)%>%distinct()

occ1950_occscore_1940<-vroom("ipums/census1940.csv.gz", delim = ",")%>%
  clean_names()%>%
  select(occ1950, occscore)%>%distinct()

# append 1910, 1920, 1930, 1940
occ1950_occscore_1910_to_1940<-rbind(occ1950_occscore_1910, 
                                     occ1950_occscore_1920, 
                                     occ1950_occscore_1930, 
                                     occ1950_occscore_1940)

# are there multiple entries of occscore within occ1950 values?
occ1950_occscore_1910_to_1940<-occ1950_occscore_1910_to_1940%>%distinct()
occ1950_occscore_1910_to_1940%>%group_by(occ1950)%>%mutate(n=n())%>%filter(n>1)%>%nrow()
# confirmed that there are not (0 rows result)

# save the mapping from occ1950 to occscore as a csv
occ1950_occscore_1910_to_1940%>%
  write_csv("occ1950_to_occscores_(1910-40).csv")