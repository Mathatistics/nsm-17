library(gganimate)
require(tidyverse)

# Multicollinearity
dta <- map_df(1:15, ~tibble(
  gamma = c(seq(0.1, 0.5, length.out = 6), seq(0.6, 1.2, length.out = 4)),
  lambda = exp(-1 * gamma * (.x - 1))
), .id = "variable") %>% 
  mutate(variable = as.numeric(variable))

plt <- ggplot(dta, aes(variable, lambda, frame = paste("Degree of multicollinearity:", round(gamma, 2)))) +
  geom_bar(stat = "identity", position = "identity", fill = "lightgrey") +
  geom_point() + geom_line(group = 1) +
  labs(x = "Variable", y = "Eigenvalues") +
  scale_x_continuous(breaks = unique(dta$variable)) +
  theme(text = element_text(size = 18))

gganimate(plt, "gif-factory/multicollinearity.gif")
