(dagify(DaysPhysHlthBad ~ DaysMentHlthBad + SleepHrsNight + Age + HHIncomeMid + BMI + Depressed,
       SleepHrsNight ~ TVHrsDay + Age + HHIncomeMid + Depressed,
       DaysMentHlthBad ~ SleepHrsNight + TVHrsDay,
       coords = list(x = c(SleepHrsNight = 1, DaysPhysHlthBad = 5, DaysMentHlthBad = 5, Age = 3, HHIncomeMid = 3, BMI = 5, Depressed = 3, TVHrsDay = 1),
                     y = c(SleepHrsNight = 1, DaysPhysHlthBad = 1, DaysMentHlthBad = .5, Age = 1.5, HHIncomeMid = 2, BMI = 2, Depressed = 2.5, TVHrsDay = .5))) %>%
  tidy_dagitty() %>%
  ggdag_classic() + 
  expand_limits(x = c(.5, 6))+
  theme_void()) %>%
  print()
