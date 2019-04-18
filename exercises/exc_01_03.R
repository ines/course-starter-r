library("rjson")
library(ggplot2)

# This code will run relative to the root of the repo, so we can load files
data <- fromJSON(file = "exercises/mtcars.json")

# Print the first record in the data
print(___[____])

# Assign the length of data to some_var
some_var <- ___

qplot(mpg, data = data)
