#
# Defined global objects.
# 
# Share data between server.R and ui.R
# 


# load data
my_data <- read.csv('./data/Data.csv', header = TRUE, na.strings = '..', nrows = 4920)
# edit colnames
colnames(my_data)[5:20] <- c(2000:2015)