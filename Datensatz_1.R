data_df <- read.csv("link zu daten", sep=";")

library(reshape2)
library(stringr)


data_df$j2020 <- paste(data_df$SBD_20, data_df$Bem_2020, sep=",")
data_df$j2021 <- paste(data_df$SBD_21, data_df$Bem_2021, sep=",")
data_df$j2022 <- paste(data_df$SBD_22, data_df$Bem_2022, sep=",")

data_df[3:8] <- list(NULL)

molted_df = melt(
  data_df, 
  id.vars=c("BAUM_CODE", "PLOTID"),
  variable.name = "Year",
  value.name = "test_value"
)


molted_df[c("SBD", "Bemerkung")] <- str_split_fixed(molted_df$test_value, ",", 2)

molted_df[4] <- NULL


molted_df["Year"] <- lapply(molted_df["Year"], function(x) as.numeric(gsub("\\D", "", x)))

molted_df <- cbind(Sample_ID = rownames(molted_df), molted_df)

molted_df <- molted_df[,c(1,4,2,3,5,6)]

write.csv(molted_df, "./bearbeitete Daten/output_skript2.csv")
