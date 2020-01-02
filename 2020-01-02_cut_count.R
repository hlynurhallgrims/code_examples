suppressPackageStartupMessages(library(tidyverse))

my_breaks <- 0:10 / 10

set.seed(4000)
tibble(my_var = runif(4000)) %>% 
  mutate(my_var_cut = cut(x = my_var, breaks = my_breaks, right = FALSE)) %>% 
  group_by(my_var_cut) %>% 
  summarize(n = n()) %>% 
  mutate(share = n / sum(n))
#> # A tibble: 10 x 3
#>    my_var_cut     n  share
#>    <fct>      <int>  <dbl>
#>  1 [0,0.1)      389 0.0972
#>  2 [0.1,0.2)    427 0.107 
#>  3 [0.2,0.3)    387 0.0968
#>  4 [0.3,0.4)    436 0.109 
#>  5 [0.4,0.5)    381 0.0952
#>  6 [0.5,0.6)    390 0.0975
#>  7 [0.6,0.7)    378 0.0945
#>  8 [0.7,0.8)    400 0.1   
#>  9 [0.8,0.9)    380 0.095 
#> 10 [0.9,1)      432 0.108
