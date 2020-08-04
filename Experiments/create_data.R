set.seed(2000)

df <- tibble(gender = sample(c('Male','Female'), 1000, replace = TRUE),
             region = sample(c('SW','NE','SE','NW'), 1000, replace = TRUE, prob = c(.1, .3, .3, .3)),
             last_purchase = runif(1000)*100) %>%
  mutate(assigned_coupon = case_when(
    gender == 'Male' ~ runif(1000) > .6,
    TRUE ~ runif(1000) > .4
  )) %>%
  mutate(getter = runif(1000)) %>%
  mutate(sent_coupon = case_when(
    getter < .1 ~ FALSE,
    getter > .95 ~ TRUE,
    TRUE ~ assigned_coupon
  )) %>%
  mutate(next_purchase = last_purchase + 10*(gender == 'Female') + 20*sent_coupon + runif(1000,-50,50)) %>%
  mutate(next_purchase = case_when(
    next_purchase < 0 ~ 0,
    TRUE ~ next_purchase
  )) %>%
  mutate(attrit_prob = .3 - (last_purchase/800) - sent_coupon*(last_purchase/100)) %>%
  mutate(next_purchase = case_when(
    runif(1000) < attrit_prob ~ NA_real_,
    TRUE ~ next_purchase
  )) %>%
  select(-attrit_prob, -getter)

attr(df$gender, 'label') = 'Gender'
attr(df$region, 'label') = 'Geographic Region'
attr(df$last_purchase, 'label') = 'Size of most recent purchase before experiment'
attr(df$next_purchase, 'label') = 'Size of next purchase after experiment'
attr(df$assigned_coupon, 'label') = 'Randomly assigned to receive a coupon'
attr(df$sent_coupon, 'label') = 'Actually was sent a coupon'
