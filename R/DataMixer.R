library(dplyr)

# 1. Read in a file named InData.csv
MyData<-read.csv("InData.csv")

# 2. Remove rows with 'Total' biomass <60
FiltData<-filter(MyData, Total<60)

# 3. Reorder the columns so that they are in the order: total, taxon, scenario, nutrients, and remove the other columns
NewData<-select(FiltData, Total, Taxon, Scenario, Nutrients)

# 4. Make a new column TotalG, which converts the 'total' column from mg to grams AND replace total with TotalG
NewData$Total<-NewData$Total/1000
NewData<-rename(NewData, TotalG = Total)

# 5. If there is a column called "Nutrients", replace each string with its first letter
if("Nutrients" %in% colnames(NewData)) {
  NewData$Nutrients<-gsub("(\\w)\\w+", "\\1", NewData$Nutrients)
}

# 6. Replace all the '.' with ',' in the 'TotalG' column
NewData$TotalG<-gsub("\\.", ",", NewData$TotalG)
