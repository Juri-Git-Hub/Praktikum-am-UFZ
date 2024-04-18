data_df <- read.csv("link", sep=";")

library(reshape2)


data_df[14:15] <- list(NULL)


molted_df = melt(
  data_df, 
  id.vars=c("BAUM_CODE", "PLOTID", "BAUMART17"),
  variable.name = "test_variable",
  value.name = "test_value"
)

molted_df <- cbind(Sample_ID = rownames(molted_df), molted_df)

molted_df$Year <- molted_df$test_variable

head(molted_df)

molted_df["Year"] <- lapply(molted_df["Year"], function(x) as.numeric(gsub("\\D", "", x)))

molted_df$Year <- sub("^", "20", molted_df$Year)


molted_df <- molted_df[,c(1,7,2,3,4,5,6)]



write.csv(molted_df, "./bearbeitete Daten/output.csv")
