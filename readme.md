Andrew Fairless, December 2010
modified May 2015 for posting onto Github
This script executes analyses of (co)variance for Fairless et al 2012
Fairless et al 2012, doi: 10.1016/j.bbr.2011.12.001, PMID:  22178318, PMCID:  PMC3474345

The fictional data in "altereddata.txt" were modified from the original 
empirical data used in Fairless et al 2012.
I am using fictional data instead of the original data because I do not have 
permission of my co-authors to release the data into the public domain.  
NOTE:  Because these data are fictional, several important characteristics of
these data may be different from those of the original data (e.g., interrater
correlations are probably lower, behaviors may not sum properly)

Each row is a separate mouse.
The left-most 3 columns are quasi-independent variables (mouse strain, sex, and age).
The right-most 5 columns are dependent variables describing behaviors of the
mice during the Social Approach/Choice Test.

implements the ANOVAs by age group as described in Fairless et al 2012:
"To further investigate how the strains differed in their sociability across 
development, we followed with analyses at each age group. . . . At 19 days of 
age, 2 × 2 (strain by sex) ANOVAs (conventional and 20% trimmed means) showed 
that BALB/cJ mice were less sociable than C57BL/6J mice . . . "
