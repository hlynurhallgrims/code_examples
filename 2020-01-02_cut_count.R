suppressPackageStartupMessages(library(tidyverse))

my_breaks <- 0:10 / 10

tibble(my_var = runif(4000)) %>% 
  mutate(my_var_cut = cut(x = my_var, breaks = my_breaks, right = FALSE)) %>% 
  group_by(my_var_cut) %>% 
  summarize(n = n()) %>% 
  mutate(share = n / sum(n))
#> # A tibble: 10 x 3
#>    my_var_cut     n  share
#>    <fct>      <int>  <dbl>
#>  1 [0,0.1)      388 0.097 
#>  2 [0.1,0.2)    383 0.0958
#>  3 [0.2,0.3)    414 0.104 
#>  4 [0.3,0.4)    381 0.0952
#>  5 [0.4,0.5)    406 0.102 
#>  6 [0.5,0.6)    408 0.102 
#>  7 [0.6,0.7)    379 0.0948
#>  8 [0.7,0.8)    430 0.108 
#>  9 [0.8,0.9)    410 0.102 
#> 10 [0.9,1)      401 0.100