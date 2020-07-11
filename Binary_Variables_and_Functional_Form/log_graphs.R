if (!('patchwork' %in% installed.packages())) {
  install.packages('patchwork')
}
library(patchwork)

a <- ggplot(data = tibble(x = runif(100)*10),
            aes(x = x)) +
  geom_density() +
  theme_minimal() +
  labs(title = 'Graph A')
b <- ggplot(data = tibble(x = rnorm(100)*10),
            aes(x = x)) +
  geom_density() +
  theme_minimal() +
  labs(title = 'Graph B')
c <- ggplot(data = tibble(x = exp(rnorm(100))),
       aes(x = x)) +
  geom_density() +
  theme_minimal() +
  labs(title = 'Graph C')
d <- ggplot(data = tibble(x = log(runif(100)*10)),
            aes(x = x)) +
  geom_density() +
  theme_minimal() +
  labs(title = 'Graph D')

e<- (a + b)/(c + d)
print(e)
