df <- data.frame(
  Driver_name =  c("Rick",  "Julie",  "Denver", "Johny",  "Cassandra", "Phillip"),
  Driver_level = c("A",     "C",      "D",      "A",      "B",         "B"),
  Driver_speed = c(96,       91,       89,       94,       88,          99),
  Competitor=    c("Yes",   "Yes",    "Yes",    "Yes",    "No",        "No"),
  Comp_name=     c("Julie", "Rick",   "Johnny", "Denver", "NA",        "NA"),
  Comp_level=    c("B",     "B",      "D",      "A",      "NA",        "NA"),
  Comp_speed=    c("???",   "???",    "???",    "???",    "NA",        "NA"),
  Race_day=      c(165,      165,      72,       72,       92,          65),
  Lap_number=    c(9,        9,        12,       12,       8,           4),
  Humidity=      c(33,       33,       88,       88,       12,          55),
  Temperature=   c(28,       28,       12,       12,       20,          28)
)

#install.packages("dplyr") #if you don't have it
library(dplyr)

df <- df %>% select(-Comp_speed)

df2 <- df %>% 
  select(Driver_name, Comp_speed = Driver_speed, Race_day, Lap_number)

df_updated <- df %>% 
  left_join(df2, by = c("Comp_name" = "Driver_name", "Race_day", "Lap_number"))

