library(datasets)
data(iris)

y <- split(iris, iris$Species)$virginica
y

sapply(y$Sepal.Length, mean)

z <- split(mtcars, mtcars$cyl, drop=T)

a <- lapply(z, colMeans)
