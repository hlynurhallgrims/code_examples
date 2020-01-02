suppressPackageStartupMessages(library(tidyverse))

my_breaks <- 0:10 / 10

set.seed(4000)
tibble(my_var = runif(4000)) %>% 
  mutate(my_var_cut = cut(x = my_var, breaks = my_breaks, right = FALSE)) %>% 
  group_by(my_var_cut) %>% 
  summarize(n = n()) %>% 
  mutate(share = n / sum(n))
