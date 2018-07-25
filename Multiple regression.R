#Mulitple regression analysis following example at http://rcompanion.org/rcompanion/e_05.html

install.packages("dplyr")
install.packages("FSA")
install.packages("psych")
install.packages("PerformanceAnalytics")
install.packages("car")

library(dplyr, FSA, psych, PerformanceAnalytics, car)

### Create a new data frame with only the numeric variables.
### This is required for corr.test and chart.Correlation

jffd.num = select(jffd, brand, type, DEOX, FU_B1, FU_B2, ZEAR, As, Cd, Pb)
headtail(jffd.num)

corr.test(jffd.num, use = "pairwise", method = "pearson", adjust = "none", alpha = 0.05)

#Pairwise graphs of correlation
pairs(data=jffd.num, ~ brand + type + DEOX + FU_B1 + FU_B2 + ZEAR + As + Cd + Pb)

#Pairwise graphs with correlation coefficients indicated
chart.Correlation(jffd.num, method = "pearson", histogram = TRUE, pch=16)

#Multiple regression analysis starts here
#null hypothesis  - all variance due to type only
model.null = lm(type ~ 1, data = jffd)

#full hypothesis - all items contribute to variance
model.full = lm(type ~ DEOX + FU_B1 + FU_B2 + ZEAR + As + Cd + Pb, data = jffd)

step(model.null, scope = list(upper=model.full), direction = "both", test = "F", data = jffd)

#output of above analysis gave the following final model formula, defining final model
model.final = lm(type~DEOX + FU_B2 + Pb, data = jffd)

summary(model.final)

Anova(model.final, type = "II")

