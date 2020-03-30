#directory for data set is C:\Desktop\COVIDbyCounty.xlsx






library(readr)
library(readxl)
library(lubridate)
library(xlsx)

library(XLConnect)
library(writexl)
library(dplyr)
library(data.table)

library(readr)

COVID <- read_xlsx("COVIDbyCounty.xlsx")
print(COVID)

COVID$Date <- as.Date(COVID$Date, "%y/%m/%d")
COVID$County <- as.factor(COVID$County)
COVID$State <- as.factor(COVID$State)

print(COVID)
str(COVID)

#recreating Oregon projections and extracting Oregon data
print(COVID$State)

COVID_Oregon <- subset(COVID, State == "Oregon", select = c("Date","County","Cases", "Deaths"))

print(COVID_Oregon)

#extracting NYC Data

COVID_NYC <- subset(COVID, County == "New York City", select = c("Date","County","Cases", "Deaths"))

print(COVID_NYC)

#extracting Texas Data

COVID_TX <- subset(COVID, State == "Texas", select = c("Date","County","Cases", "Deaths"))

COVID_Brazoria <- subset(COVID, County == "Brazoria", select = c("Date","County","Cases", "Deaths"))


write_xlsx(COVID_Oregon,"COVID_Oregon.xlsx")

write_xlsx(COVID_NYC,"COVID_NYC.xlsx")

write_xlsx(COVID_TX,"COVID_TX.xlsx")

write_xlsx(COVID_Brazoria,"COVID_Brazoria.xlsx")