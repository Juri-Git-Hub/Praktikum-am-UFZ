data_df <- read.csv("Y:/Gruppen/nsf/AG Auen/Projekte/Lebendige Luppe/Datentransfer/Jurek/acer_pseudoplatanus_CSV.csv")

setwd("Y:/Gruppen/nsf/AG Auen/Projekte/Lebendige Luppe/Datentransfer/Jurek/")

head(data_df)

ahorn_df <- data_df[data_df$tree_species == "Acer pseudoplatanus",]
head(ahorn_df)

ahorn_df[ahorn_df==0] <- NA

#df schoen machen: dbh + tree_biomass für jeweilige baumart
c_ahorn_df <- ahorn_df[complete.cases(ahorn_df), ]


#alle punkte plotten
plot(
  c_ahorn_df$dbh, 
  c_ahorn_df$tree_biomass, 
  "p",
  xlab = "DBH",
  ylab = "Tree Biomass",
  main = "Acer pseudoplatanus"
)


#Erstelle eine neue Variable für hours2
c_ahorn_df$dbh2 <- c_ahorn_df$dbh^2
#Quadratisches Regressionsmodell anpassen
quadraticModel <- lm(tree_biomass ~ dbh + dbh2, data=c_ahorn_df)
#Modellzusammenfassung anzeigen
summary(quadraticModel)

coefficients <- coef(quadraticModel)
a <- coefficients[1]
b <- coefficients[2]
c <- coefficients[3]


funktion <- paste(c, "(DBH)² + ", b, "(DBH) +", a)
print(funktion)
