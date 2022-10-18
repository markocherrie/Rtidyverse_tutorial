# read 1
library(readr)
read_csv()
help("read_csv")
df<-readr::read_csv("data/Ephor_F3FIHL8B_20220926.csv")

# read 2
library(readxl)
read_excel()
help("read_excel")
df <- readxl::read_excel("data/Ephor_F3FIHL8B_20220926.xlsx", sheet = "exposome1")


# Processing 1
library(dplyr)
dplyr::
  names(df)
df$month<-lubridate::month(df$timestamp)
df_sum <- df %>%
  group_by(month) %>%
  summarise(
    n = n(),
    meantemp = 	mean(temperature, 
                     na.rm = TRUE))

# Visualisation 1
library(ggplot2)
ggplot(df_sum, aes(x=month, y=meantemp, group=1))+
    geom_line()+
    theme_classic()+
    labs(title="I made this using R tidyverse",
         y="Mean Temp (degrees)",
         x="Month")


# altogether
readr::read_csv("data/Ephor_F3FIHL8B_20220926.csv") %>%
mutate(month = lubridate::month(timestamp)) %>%
  group_by(month) %>%
  summarise(
    n = n(),
    meantemp = 	mean(temperature, 
                     na.rm = TRUE)) %>%
  ggplot(., aes(x=month, y=meantemp, group=1))+
  geom_line()+
  theme_classic()+
  labs(title="I made this using R tidyverse",
       y="Mean Temp (degrees)",
       x="Month")





    
    