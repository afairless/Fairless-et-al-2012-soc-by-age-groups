# Andrew Fairless, December 2010
# modified May 2015 for posting onto Github
# This script executes analyses of (co)variance for Fairless et al 2012
# Fairless et al 2012, doi: 10.1016/j.bbr.2011.12.001, PMID:  22178318, PMCID:  PMC3474345

# The fictional data in "altereddata.txt" were modified from the original 
# empirical data used in Fairless et al 2012.
# I am using fictional data instead of the original data because I do not have 
# permission of my co-authors to release the data into the public domain.  
# NOTE:  Because these data are fictional, several important characteristics of
# these data may be different from those of the original data (e.g., interrater
# correlations are probably lower, behaviors may not sum properly)

# Each row is a separate mouse.
# The left-most 3 columns are quasi-independent variables (mouse strain, sex, and age).
# The right-most 5 columns are dependent variables describing behaviors of the
# mice during the Social Approach/Choice Test.

data = read.table("altereddata.txt", header = TRUE)      
agesplit = split(data, data$age)

# implements the ANOVAs by age group as described in Fairless et al 2012:
# "To further investigate how the strains differed in their sociability across 
# development, we followed with analyses at each age group. . . . At 19 days of 
# age, 2 × 2 (strain by sex) ANOVAs (conventional and 20% trimmed means) showed 
# that BALB/cJ mice were less sociable than C57BL/6J mice . . . "

for (agegroup in 1:length(agesplit)) {       # loop iterates over each age group

     # implements conventional ANOVA
     aovmodelfull = aov(soc.3rd5min~strain*sex, data = agesplit[[agegroup]])

     sink(file = paste("conventionalanova", names(agesplit)[agegroup], ".txt", sep = ""))
     print(aovmodelfull)
     print(summary(aovmodelfull))
     sink(file = NULL)

     # diagnostic plots for the conventional ANOVA model
     png(file = paste("diagnostics,conventionalanova,", names(agesplit)[agegroup], 
                      ".png", sep = ""), width = 1280, height = 1024)
     layout(matrix(c(1, 2, 3, 4), 2, 2))
     plot(aovmodelfull)
     dev.off()

     # implements robust ANOVA
     source("Rallfun-v13.txt")
     agesplit = split(data, data$age)
     data3 = agesplit[[agegroup]]
     depvarcol = dim(data)[2]
     data4 = data.matrix(cbind(data3[ , 1], data3[ , 2], data3[ , depvarcol]))

     sink(file = paste("robustanova", names(agesplit)[agegroup], ".txt", sep = ""))
     print(paste("The dependent variable is:  ", colnames(data3)[depvarcol]))
     print(paste("Factor 1 or A is:  ", colnames(data3)[1]))
     print(paste("Factor 2 or B is:  ", colnames(data3)[2]))
     print(t2way(2, 2, data4, MAT = T))
     sink(file = NULL)

}