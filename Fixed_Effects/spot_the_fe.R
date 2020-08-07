if (!('patchwork' %in% installed.packages())) {
  install.packages('patchwork')
}
library(patchwork)

pnlsmall <- mathpnl %>%
  filter(distid %in% c(50220,2010,27020,68030))

pnlsmall <- pnlsmall %>%
  mutate(distid = factor(distid)) %>%
  mutate(fepred = predict(lm(math4~expp + distid, data = pnlsmall)),
         polypred = predict(lm(math4~expp + I(expp^2), data = pnlsmall)))

a <- ggplot(pnlsmall,
            aes(x = expp, y = math4, color = distid)) +
  geom_point(size = 2)+ 
  geom_smooth(aes(color = NULL), method = 'lm', se = FALSE, color = 'blue', size = 1) +
  theme_minimal() +
  labs(title = 'Graph A')
b <- ggplot(pnlsmall,
            aes(x = expp, y = math4, color = distid, group = distid)) +
  geom_point(size = 2)+ 
  geom_smooth(method = 'lm', se = FALSE, color = 'blue', size = 1) +
  theme_minimal() +
  labs(title = 'Graph B')
c <- ggplot(pnlsmall,
            aes(x = expp, y = math4, color = distid)) +
  geom_point(size = 2)+ 
  geom_line(aes(y = polypred, color = NULL), color = 'blue', size = 1) +
  theme_minimal() +
  labs(title = 'Graph C')
d <- ggplot(pnlsmall,
            aes(x = expp, y = math4, color = distid, group = distid)) +
  geom_point(size = 2)+ 
  geom_line(aes(y = fepred), color = 'blue', size = 1) +
  theme_minimal() +
  labs(title = 'Graph D')

e<- (a + b)/(c + d)
print(e)

rm(a)
rm(b)
rm(c)
rm(d)
rm(e)