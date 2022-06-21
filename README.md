# Prices-Profits-and-Power-Replication-Code
This is R code for taking Compustat data and cleaning it for the paper "Prices, Profits, and Power: An Analysis of 2021 Firm-Level Markups" by Mike Konczal and Niko Lusiani, from the Roosevelt Institute:
https://rooseveltinstitute.org/publications/prices-profits-and-power/

This methodology and specific code is replicated, in large part, from the paper "The Rise of Market Power and the Macroeconomic Implications" by De Loecker, Jan; Eeckhout, Jan; Unger, Gabriel. Their Stata code has been replicated over to R, any errors are introduced here. Their replication code can be found at:
https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/5GH8XO

The Compustat data for this code needs to be obtained on your own due to restrictions.

Prices_Profits_Power.pdf is the final paper.

1_Compustat_data_creation.R takes in Compustat data, cleans it, and creates the variables necessary to analyze markups. It pulls in files from the data folder to help with this process.

2_Analysis_for_paper.R runs the statistics, graphics, and regressions necessary for creating the paper. The paper folder has the R markdown file for creating the paper that uses this code.

3_Create_standalone_graphics.R creates the graphics from the paper in the graphics folder. This assumes the first two files have been run and their variables are in your environment.

4_Statement_fact_check.R has code to confirm various statements within the paper.  This assumes the first two files have been run and their variables are in your environment.