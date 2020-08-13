suppressWarnings(suppressMessages(ggplot(TitanicSurvival %>% filter(!is.na(age) & !is.na(surv_TF)), aes(x = age, y = surv_TF*1)) + 
  geom_point() + 
  geom_smooth(se = FALSE, color = 'blue') + 
  geom_smooth(method = 'lm', se = FALSE, color = 'red') + 
  labs(x = 'Age', y = 'Survival') + 
  theme_minimal() +
  annotate(geom = 'label', x = 60, y = .75, color = 'red', label = 'LPM') +
  annotate(geom = 'label', x = 60, y = .65, color = 'blue', label = 'Local Means'))) %>%
  print()
