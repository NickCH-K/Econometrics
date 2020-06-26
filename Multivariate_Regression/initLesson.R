# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.

if (!(('ggdag' %in% rownames(installed.packages())))) {
  install.packages('ggdag')
}

library(ggdag)

set.seed(5661299)
ex <- data.frame(u = rnorm(100), C = rnorm(100), B = rnorm(100))
ex$D <- ex$u + rnorm(100)
ex$E <- ex$u + rnorm(100)
ex$A <- ex$C + ex$B + rnorm(100)
ex$X <- ex$C + ex$D + ex$E + rnorm(100)
ex$Y <- ex$X + ex$B + ex$D + rnorm(100)
example_dgp <- ex
rm(ex)