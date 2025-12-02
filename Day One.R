# Installing and loading package for string manipulation
# install.packages("stringr")
library(stringr)

#setting working directory and loading directions text.
setwd("C:/Users/seant/OneDrive/Desktop/Advent of Code/2025 Day 1")
directions <- read.table("directions.txt")
rotations <- str_extract_all(directions, "[LR][0-9]+")[[1]]

dialpoint <- 50
zero_count <- 0

for (i in rotations) {
  direction <- str_sub(i, 1, 1)
  numstr <- str_sub(i, 2)
  val <- as.integer(numstr)
  startval <- dialpoint
  
  if (direction == "L") {
    endval <- startval - val
    #now subtracting 1 to previous startval in case dialpoint was 0 so we don't double-count
    #and setting range
    range <- seq(startval - 1, endval)
    cross_hit_zero <- sum(range %% 100 == 0)
    
  } else {
    endval <- startval + val
    #adding 1 to previous startval to avoid double-count and setting range
    range <- seq(startval +1, endval)
    cross_hit_zero <- sum(range %% 100 == 0)
  }
  
  zero_count <- zero_count + cross_hit_zero
  
  # resetting dial to '0-99'
  dialpoint <- endval %% 100
  
  ##### [previous zero check] dialpoint <- dialpoint %% 100
  ##### [previous zero counter] if (dialpoint == 0) {zero_count <- zero_count+1}
}

