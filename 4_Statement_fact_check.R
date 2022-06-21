####
# 4_Statement_fact_check
# Author: Mike Konczal
# Date: June 21th, 2022
#
# This is R code for verifying and fact-checking many of the statements in the paper
# "Prices, Profits, and Power: An Analysis of 2021 Firm-Level Markups"
# by Mike Konczal and Niko Lusiani, from the Roosevelt Institute:
# https://rooseveltinstitute.org/publications/prices-profits-and-power/
#
# This code lists multiple factual statements made in the paper, with code showing
# that the statements were true with the dataset we used.
# It takes in Compustat data that has been cleaned through 1_Compustat_data_creation,
# with analysis and paper graphics created in 2_Analysis_for_paper,
# and it assumes both are already loaded in the environment when it is run.

setwd("/Users/mkonczal/Documents/GitHub/Prices-Profits-and-Power-Replication-Code/")
library(janitor)
library(tidyverse)
library(ggtext)
library(haven)

# There are 3698 observations for 2021 after data cleaning.
tail(cs_m %>% group_by(year) %>% summarize(n = n()))

# There are 265893 observations between 1955 and 2020.
tail(cs_m %>% filter(year < 2021) %>% summarize(n = n()))

# When it comes to sales, for instance, the 75th percentile has 22 times the sales of the 25th percentile,
cs_m %>% group_by(year) %>% summarize(FirstQ = quantile(sale, 0.25), ThirdQ = quantile(sale, 0.75), ratio = ThirdQ/FirstQ) %>%
  ungroup() %>% mutate(mean_ratio = mean(ratio))

# while the 90th percentile firm has over 400 times the sales of the 10th percentile.
cs_m %>% group_by(year) %>% summarize(NinethQ = quantile(sale, 0.90), TenthQ = quantile(sale, 0.10), ratio = NinethQ/TenthQ) %>%
  ungroup() %>% mutate(mean_ratio = mean(ratio))

# We find that markups in the year 2021 were both the highest level on record and the largest one-year increase,
# around three times the increase of the next several large annual increases.
g3_1_diff <- g3_1 %>% mutate(M1d = Markup1 - lag(Markup1,1), M2d = Markup2 - lag(Markup2,1))
g3_1_diff %>% arrange(desc(M1d))
g3_1_diff %>% arrange(desc(M2d))

# While markups averaged 1.26 between 1960 and 1980, they began a slow and consistent rise since then, averaging 1.56 during the 2010s
g3_1_diff %>% select(year, Markup2) %>% filter(year > 1959, year < 1981) %>% summarize(avg = mean(Markup2))
g3_1_diff %>% select(year, Markup2) %>% filter(year > 2009, year < 2021) %>% summarize(avg = mean(Markup2))

# In 2021 markups suddenly increased to 1.72
g3_1_diff %>% select(year, Markup2) %>% filter(year == 2021)

# We see it going from 14.6 percent from the 1960s through the 1980s to 16.6 percent during the 2010s.
# However it jumps to 19 percent in 2021.
# The 3.3 percent annual increase to that level is more than twice the next highest annual increase across this time period.
# Here we see a more consistent range, with it going from averaging 5.4 percent from 1960 to 1980 to averaging 5.6 percent during the 2010s.
# In 2021 it jumped to 9.6 percent, again its highest value on record.
g31_1 %>% group_by(type) %>% filter(year > 1959, year < 1981) %>% summarize(avg = mean(type_values))
g31_1 %>% group_by(type) %>% filter(year > 2009, year < 2021) %>% summarize(avg = mean(type_values))
g31_1 %>% filter(type == "Operating Profit Margin") %>% arrange(desc(type_values))
g31_1 %>% filter(type == "Net Profit Margin") %>% arrange(desc(type_values))

#The 3.3 percent annual increase to that level is more than twice the next highest annual increase across this time period
g31_1 %>% group_by(type) %>% filter(type == "Operating Profit Margin") %>%
  mutate(diff = type_values - lag(type_values,1)) %>% arrange(desc(diff))

# The median and the 25th percentile of markups, for instance, increased to their highest level on record.
pcs_m %>% filter(p_name == "p90") %>% select(year, p_name, p_value) %>% group_by(year) %>% summarize(n = max(p_value)) %>% arrange(desc(n))
pcs_m %>% filter(p_name == "p75") %>% select(year, p_name, p_value) %>% group_by(year) %>% summarize(n = max(p_value)) %>% arrange(desc(n))
pcs_m %>% filter(p_name == "p50") %>% select(year, p_name, p_value) %>% group_by(year) %>% summarize(n = max(p_value)) %>% arrange(desc(n))
pcs_m %>% filter(p_name == "p25") %>% select(year, p_name, p_value) %>% group_by(year) %>% summarize(n = max(p_value)) %>% arrange(desc(n))


# From 1980 to 2020, 88 percent of the increase in markups have come from within industries,
# Yet for 2021, markups within industries was just 61 percent.
table2 %>% filter(year == 2019)
0.306/(0.306+0.0728)
table2 %>% filter(year == 2019 | year == 2021) %>% group_by(key) %>% summarize(diff = value-lag(value,1))
0.0561/(0.0561+0.0906)

# In the 2021 cross-section of firms, the 75th percentile of sales is 21 times larger than the 25th percentile;
# that ratio is 645 times larger for the 90th percentile versus the 10th.
size_diff <- mp %>% filter(year == 2021) %>% filter(!is.na(diff_MU1S)) %>%
  summarize(count = n(), sales25 = quantile(sale_D, 0.25), sales75 = quantile(sale_D, 0.75))
size_diff$sales75/size_diff$sales25

size_diff <- mp %>% filter(year == 2021) %>% filter(!is.na(diff_MU1S)) %>%
  summarize(count = n(), sales10 = quantile(sale_D, 0.10), sales90 = quantile(sale_D, 0.90))
size_diff$sales90/size_diff$sales10
