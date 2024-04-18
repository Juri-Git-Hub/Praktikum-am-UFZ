setwd("link zu daten")

library(tidyverse)
data_df <- read.csv("link zu daten")


bhd_df <- data_df[, colnames(data_df)[c(2,3,4,5,10,11,13)]]


bhd_df$Status<- str_trim(bhd_df$Status)


bhd_df2 <- bhd_df[bhd_df$Status=="persistent",]


bhd_df2$BHD<- as.numeric(bhd_df2$BHD)

middle_bhd <- aggregate(bhd_df2$BHD, list(bhd_df2$Species,bhd_df2$Year), mean)
head(middle_bhd)



middle_bhd <- middle_bhd %>% group_by(Group.1)


head(middle_bhd)
head(bhd_df2)

bhd_df3 <- bhd_df2[, colnames(bhd_df2)[c(1,2,3,4,6,7)]]

head(bhd_df3)


library(dplyr)

zuwachs_df <- middle_bhd %>%
  group_by(Group.1) %>%
  summarize(Zuwachs_pro_Jahr = (last(x) - first(x)) / (last(Group.2) - first(Group.2)))


head(zuwachs_df, 50)






library(reshape2)

middle_bhd_melt <- melt(
  middle_bhd,
  id=c("Group.1")
)

head(middle_bhd_melt)
