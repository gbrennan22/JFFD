#http://cc.oulu.fi/~jarioksa/opetus/metodi/vegantutor.pdf

betad <- betadiver(jffd, "z")
adonis(betad ~ type, data = jffd.num, perm = 200)

#Call:adonis(formula = betad ~ type, data = jffd.num, permutations = 200) 

#Permutation: free
#Number of permutations: 200

#Terms added sequentially (first to last)

#Df SumsOfSqs MeanSqs F.Model      R2   Pr(>F)   
#type       1    1.3208 1.32080  42.404 0.42234 0.004975 **
#Residuals 58    1.8066 0.03115         0.57766            
#Total     59    3.1274                 1.00000            
#---
#Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1