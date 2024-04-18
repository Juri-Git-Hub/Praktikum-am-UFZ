data_df <- read.csv("link zu daten", sep=",")
head(data_df)


library(reshape2)



bhd_df <- data_df[, colnames(data_df)[c(1,8,12,13)]]
bhd_interp_df <- data_df[, colnames(data_df)[c(1,8,14,15)]]
bhd_height_df <- data_df[, colnames(data_df)[c(1,8,16,17)]]
h_crown_base_df <- data_df[, colnames(data_df)[c(1,8,18,19)]]
tree_height_df <- data_df[, colnames(data_df)[c(1,8,20,21)]]
tree_social_df <- data_df[, colnames(data_df)[c(1,8,24,25)]]
crown_df <- data_df[, colnames(data_df)[c(1,8,26,27)]]
vitality_df <- data_df[, colnames(data_df)[c(1,8,28,29)]]
mechanical_dmg_df <- data_df[, colnames(data_df)[c(1,8,30,31)]]
crown_dmg_df <- data_df[, colnames(data_df)[c(1,8,32,33)]]
drought_dmg_df <- data_df[, colnames(data_df)[c(1,8,34,35)]]
trunk_rot_df <- data_df[, colnames(data_df)[c(1,8,36,37)]]
trunk_fungi_df <- data_df[, colnames(data_df)[c(1,8,38,39)]]
other_fungi_df <- data_df[, colnames(data_df)[c(1,8,40,41)]]
other_dmg_df <- data_df[, colnames(data_df)[c(1,8,42,43)]]


bhd_df <- melt(
  bhd_df, 
  id=c("PLOT_ID", "Tree_ID"),
  variable.name = "test_var",
  value.name = "test_value"
)

bhd_interp_df <- melt(
  bhd_interp_df, 
  id=c("PLOT_ID", "Tree_ID"),
  variable.name = "test_var2",
  value.name = "test_value2"
)

bhd_height_df <- melt(
  bhd_height_df, 
  id=c("PLOT_ID", "Tree_ID"),
  variable.name = "test_var3",
  value.name = "test_value3"
)

h_crown_base_df <- melt(
  h_crown_base_df, 
  id=c("PLOT_ID", "Tree_ID"),
  variable.name = "test_var4",
  value.name = "test_value4"
)

tree_height_df <- melt(
  tree_height_df, 
  id=c("PLOT_ID", "Tree_ID"),
  variable.name = "test_var5",
  value.name = "test_value5"
)

tree_social_df <- melt(
  tree_social_df, 
  id=c("PLOT_ID", "Tree_ID"),
  variable.name = "test_var6",
  value.name = "test_value6"
)

crown_df <- melt(
  crown_df, 
  id=c("PLOT_ID", "Tree_ID"),
  variable.name = "test_var7",
  value.name = "test_value7"
)

vitality_df <- melt(
  vitality_df, 
  id=c("PLOT_ID", "Tree_ID"),
  variable.name = "test_var8",
  value.name = "test_value8"
)

mechanical_dmg_df <- melt(
  mechanical_dmg_df, 
  id=c("PLOT_ID", "Tree_ID"),
  variable.name = "test_var9",
  value.name = "test_value9"
)

crown_dmg_df <- melt(
  crown_dmg_df, 
  id=c("PLOT_ID", "Tree_ID"),
  variable.name = "test_var10",
  value.name = "test_value10"
)

drought_dmg_df <- melt(
  drought_dmg_df, 
  id=c("PLOT_ID", "Tree_ID"),
  variable.name = "test_var11",
  value.name = "test_value11"
)

trunk_rot_df <- melt(
  trunk_rot_df, 
  id=c("PLOT_ID", "Tree_ID"),
  variable.name = "test_var12",
  value.name = "test_value12"
)

trunk_fungi_df <- melt(
  trunk_fungi_df, 
  id=c("PLOT_ID", "Tree_ID"),
  variable.name = "test_var13",
  value.name = "test_value13"
)

other_fungi_df <- melt(
  other_fungi_df, 
  id=c("PLOT_ID", "Tree_ID"),
  variable.name = "test_var14",
  value.name = "test_value14"
)

other_dmg_df <- melt(
  other_dmg_df, 
  id=c("PLOT_ID", "Tree_ID"),
  variable.name = "test_var15",
  value.name = "test_value15"
)



merged_df <- data.frame(data_df$Tree_ID, data_df$date , bhd_df$test_var,data_df$veg_period_Erstinventur, data_df$veg_period_Zweitinventur,data_df$Longitude,data_df$Latitude,data_df$Elevation,data_df$PLOT_ID,data_df$Status,data_df$Species,data_df$Species_abbreviation,bhd_df$test_value,bhd_interp_df$test_value2,bhd_height_df$test_value3,h_crown_base_df$test_value4,tree_height_df$test_value5,tree_social_df$test_value6,crown_df$test_value7,vitality_df$test_value8,mechanical_dmg_df$test_value9,crown_dmg_df$test_value10,data_df$Year.Height.Measurement,data_df$Height.Interpolated,drought_dmg_df$test_value11,trunk_rot_df$test_value12,trunk_fungi_df$test_value13,other_fungi_df$test_value14,other_dmg_df$test_value15)

head(merged_df)

str(merged_df)

merged_df["data_df.date"] <- lapply(merged_df["bhd_df.test_var"], function(x) as.numeric(gsub("\\D", "", x)))

merged_df$data_df.date <- sub("^", "20", merged_df$data_df.date)

merged_df["bhd_df.test_var"] <- NULL

write.csv(merged_df, "./bearbeitete Daten/output_skript3.csv")



data_df$j2020 <- paste(data_df$SBD_20, data_df$Bem_2020, sep=",")
molted_df[c("SBD", "Bemerkung")] <- str_split_fixed(molted_df$test_value, ",", 2)
