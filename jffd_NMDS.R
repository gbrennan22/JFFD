#non-parametric multidimensional scaling https://jonlefcheck.net/2012/10/24/nmds-tutorial-in-r/
#The goal of NMDS is to collapse information from multiple dimensions (e.g, from multiple communities, sites, etc.) into just a few, so that they can be visualized and interpreted.

install.packages("vegan")
library(vegan)

#reduce dataset to only the mycotoxins and heavy metals
jffd.chem <- select(jffd, sample, DEOX, FU_B1, FU_B2, ZEAR, As, Cd, Pb)

#Convert sample from factor to numeric, to compensate for previous conversion for multiple regression test
jffd$sample <- as.numeric(as.character(jffd$sample))

jffd_NMDS=metaMDS(jffd.chem, k=2, trymax = 100)

#Shepard plot - distances between each pair of communities and their original dissimilarities
stressplot(jffd_NMDS)

plot(jffd_NMDS)

#designate grain v no grain
grain = jffd$type

#plot polygons highlighting groups for grain (1) v no grain (0)
ordiplot(jffd_NMDS, type = "n")
ordihull(jffd_NMDS, groups = grain, draw = "polygon", col = "grey90", label = T)
orditorp(jffd_NMDS, display="species",col="red",air=0.01)
orditorp(jffd_NMDS, display="sites", air=0.01,cex=1.25)