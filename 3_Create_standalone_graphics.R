####
# 3_Create_standalone_graphics
# Author: Mike Konczal
# Date: June 21th, 2022
#
# This is R code for creating standalone graphics
# that are part of the paper:
# "Prices, Profits, and Power: An Analysis of 2021 Firm-Level Markups"
# by Mike Konczal and Niko Lusiani, from the Roosevelt Institute:
# https://rooseveltinstitute.org/publications/prices-profits-and-power/
#
# These graphics are replications or otherwise inspired from the paper:
# "The Rise of Market Power and the Macroeconomic Implications"
# by De Loecker, Jan; Eeckhout, Jan; Unger, Gabriel, 2020,
# whose replication code can be found at:
# https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/5GH8XO
#
# Their Stata code has been replicated over to R, any errors are introduced here.
#
# This code takes in Compustat data that has been cleaned through 1_Compustat_data_creation,
# with analysis and paper graphics created in 2_Analysis_for_paper,
# and it assumes both are already loaded in the environment when it is run.


setwd("/Users/mkonczal/Documents/GitHub/Prices-Profits-and-Power-Replication-Code/")
library(janitor)
library(tidyverse)
library(ggtext)
library(haven)


SA_g3_1p <- g3_1p + geom_line(size=2, color="red") +  labs(y = NULL, x = NULL,
                           title = "Figure 1: Markups have increased",
                           caption ="Compustat, author's calculation. Prices, Profits, and Power: Roosevelt Institute") +
  theme(plot.title.position = "plot", plot.title = element_text(size=28), axis.text.x = element_text(size=20))

SA_m1_g1 <- ml_g1 + geom_line(size=2) +  labs(y = NULL, x = NULL,
                                  title = "Figure 2: Sales have increased more than costs",
                                  ylab="Average firm value in sample by year",
                                  caption ="Compustat, author's calculation. Prices, Profits, and Power: Roosevelt Institute") + 
  theme(plot.title.position = "plot", plot.title = element_text(size=28), axis.text.x = element_text(size=20))

SA_g31_1p <- g31_1p + geom_line(size=2) +  labs(y = NULL, x = NULL,
                                  title = "Figure 3: Profit margins are at record highs",
                                  caption ="Compustat, author's calculation. Prices, Profits, and Power: Roosevelt Institute") + 
  theme(plot.title.position = "plot", plot.title = element_text(size=28), axis.text.x = element_text(size=20))

SA_dist1 <- dist1 + geom_line(size=2) +  labs(y = NULL, x = NULL,
                                 title = "Figure 4: Markups distribution increases overall, especially at the top",
                                 caption ="Compustat, author's calculation. Prices, Profits, and Power: Roosevelt Institute") + 
  theme(plot.title.position = "plot", plot.title = element_text(size=28), axis.text.x = element_text(size=20))

SA_i_mu_g <- i_mu_g +  labs(y = NULL, x = "Difference between 2021 and pre-pandemic levels",
                                 title = "Figure 5: Markups have a strong industry story",
                                 caption ="Compustat, author's calculation. Prices, Profits, and Power: Roosevelt Institute") + 
  theme(plot.title.position = "plot", plot.title = element_text(size=28), axis.text.x = element_text(size=20))


SA_within_graphic2 <- within_graphic2 + geom_line(size=2) +  labs(
                                 title = "Figure 6: A partial shift from within industries to between industries",
                                  caption ="Compustat, author's calculation. Prices, Profits, and Power: Roosevelt Institute") + 
  theme(plot.title.position = "plot", plot.title = element_text(size=28), axis.text.x = element_text(size=20))

SA_mp_g1 <- mp_g1 +  labs(
  title = "Figure 7: Relationship between previous size-adjusted markups and 2021 increases",
  caption ="Compustat, author's calculation. Prices, Profits, and Power: Roosevelt Institute") + 
  theme(plot.title.position = "plot", plot.title = element_text(size=22), axis.text.x = element_text(size=20))

SA_mp_g2 <- mp_g2 +  labs(
  title = "Figure 8: Relationship between previous size-adjusted markups and 2021 increases, outliers removed",
  caption ="Compustat, author's calculation. Prices, Profits, and Power: Roosevelt Institute") + 
  theme(plot.title.position = "plot", plot.title = element_text(size=18), axis.text.x = element_text(size=20))
####

ggsave("graphics/figure1.png", plot=SA_g3_1p, dpi="retina", width = 12, height=6.75, units = "in")
ggsave("graphics/figure2.png", plot=SA_m1_g1, dpi="retina", width = 12, height=6.75, units = "in")
ggsave("graphics/figure3.png", plot=SA_g31_1p, dpi="retina", width = 12, height=6.75, units = "in")
ggsave("graphics/figure4.png", plot=SA_dist1, dpi="retina", width = 12, height=6.75, units = "in")
ggsave("graphics/figure5.png", plot=SA_i_mu_g, dpi="retina", width = 12, height=6.75, units = "in")
ggsave("graphics/figure6.png", plot=SA_within_graphic2, dpi="retina", width = 12, height=6.75, units = "in")
ggsave("graphics/figure7.png", plot=SA_mp_g1, dpi="retina", width = 12, height=6.75, units = "in")
ggsave("graphics/figure8.png", plot=SA_mp_g2, dpi="retina", width = 12, height=6.75, units = "in")

