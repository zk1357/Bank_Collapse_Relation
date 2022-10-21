

# 2 years interval
library("FactoMineR")
library("factoextra")
library("readxl")

rm(list = ls())

data1 <- read_excel("C:/Users/zkl/Desktop/updata/格式版本/Final/Data Repository/Features of individual bends.xls",col_names = TRUE)
data2 <- read_excel("C:/Users/zkl/Desktop/updata/格式版本/Final/Data Repository/Finotello2020.xlsx",col_names = TRUE)

data.A3 <- data1[51:500,]
data.B3 <- data1[551:1000,]
data.C3 <- data1[1051:1500,]
data.C9 <- data1[1551:2000,]
data.Fluvial <- data2[1:38,]
data.Tidal <- data2[39:96,]

data<-rbind(data.A3,data.B3,data.C3, data.C9,data.Fluvial)

# The variable Species (index = 5) is removed 
# before PCA analysis 
data.pca <- PCA(data[,2:10], graph = FALSE)

fviz_pca_ind(data.pca,
             geom.ind = "point", # show points only (nbut not "text") 
             pointsize =3,
             pointshape = 21,
             fill.ind = data$Dim,
             col.ind = data$Dim, # color by groups 
             palette = c("#F05454", "#91684A", "#6886C5","#00AFBB", "#E7B800", "#54E346"),
             addEllipses = FALSE,
             legend.title = "Groups",
             title="")+             
  
  theme_bw() +
  theme(text=element_text(size=14,face="plain",color="black"),
        axis.title=element_text(size=16,face="plain",color="black"),
        axis.text = element_text(size=14,face="plain",color="black"),
        legend.title = element_text(size=16,face="plain",color="black"),
        legend.text = element_text(size=14,face="plain",color="black"),
        legend.background = element_blank(),
        legend.position=c(0.9,0.1))

ind <- get_pca_ind(data.pca)
ind1 <- ind$coord 

library("Flury")
install.packages("openxlsx")
library(openxlsx)
write.infile(ind$coord, "ind.txt", sep = ";")


fviz_pca_var(data.pca, col.var = "black")


