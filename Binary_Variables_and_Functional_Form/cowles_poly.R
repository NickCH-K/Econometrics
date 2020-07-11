print(ggplot(Cowles, aes(x = extraversion, y = volunteered*1)) + 
  geom_smooth(se = FALSE) + 
  theme_minimal() + 
  labs(x = 'extraversion',y = 'volunteered'))
