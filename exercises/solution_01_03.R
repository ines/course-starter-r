library(ggplot2)

mtcars$gear <- factor(mtcars$gear,levels=c(3,4,5),
  	labels=c("3gears","4gears","5gears"))
mtcars$am <- factor(mtcars$am,levels=c(0,1),
  	labels=c("Automatic","Manual"))
mtcars$cyl <- factor(mtcars$cyl,levels=c(4,6,8),
   labels=c("4cyl","6cyl","8cyl"))

# Print the gear variable of mtcars
print(mtcars$gear)

# Assign the length of mtcars to some_var
some_var <- length(mtcars)

# Uncomment this to see the plot
# print(qplot(mpg, data=mtcars, geom="density", fill=gear, alpha=I(.5)))
