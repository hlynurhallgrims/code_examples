library(nycflights13)
library(tidyverse)

flights %>% 
  map_dbl(~sum(is.na(.))) %>% # Count the number of NA rows per column in a dataframe
  as_data_frame() %>% 
  rownames_to_column() %>% 
  arrange(desc(value))

carriers <- split(flights, flights$carrier)

carriers %>% 
  map_dbl(~sum((.$arr_delay - .$dep_delay), na.rm = TRUE)) %>% # Calculate the total inflight delay for 2013 per carrier
  as_data_frame() %>% 
  rownames_to_column() %>%
  arrange(value)

# # Of course, this is just for an example with lists. The easier thing to do if you already have 1 single dataframe 
# # ... is the following: 
#flights %>% 
#  mutate(in_flight_delay = arr_delay - dep_delay) %>% 
#  group_by(carrier) %>% 
#  summarize(total = sum(in_flight_delay, na.rm = TRUE)) %>% 
#  arrange(total)
