# Stack Overflow Answer
#https://stackoverflow.com/questions/58998390/adjusting-rugplot-in-ggplot2/58998929#58998929


# 1st iteration -----------------------------------------------------------

library(tidyverse)

set.seed(42)
dummy_data <- tibble(x_var = rnorm(100),
                     y_var = abs(rnorm(100)) * x_var) %>%
  rownames_to_column(var = "temp_row") %>% 
  mutate(color_id = if_else(as.numeric(temp_row) <= 50,
                            "Type A",
                            "Type B"))

ggplot(data = dummy_data, mapping = aes(x = x_var, y = y_var)) +
  geom_smooth(method = "lm") +
  geom_rug(mapping = aes(color = color_id), sides = "b")


# Update ------------------------------------------------------------------

library(tidyverse)

set.seed(42)
dummy_data <- tibble(x_var = rnorm(100),
                     y_var = abs(rnorm(100)) * x_var) %>%
  rownames_to_column(var = "temp_row") %>% 
  mutate(color_id = if_else(as.numeric(temp_row) <= 50,
                            0,
                            1))

ggplot(data = dummy_data, mapping = aes(x = x_var, y = y_var)) +
  geom_smooth(method = "lm") +
  geom_rug(mapping = aes(color = factor(color_id)), sides = "b") +
  scale_color_manual(values = c("black", "red")) +
  labs(color = "This takes two values")
