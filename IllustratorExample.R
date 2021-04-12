

library(tidyverse)

# theme_set(theme_bw() +
#             theme(panel.border = element_blank(), panel.grid.major = element_blank(),
#                   panel.grid.minor = element_blank(),
#                   axis.line = element_line(colour = "black")))



X <- data.frame(BeardLength = rnorm(20, 5), Puns = c(runif(10, 2, 4), runif(10, 3, 5)), Color = rep(c("red", "brown"), each = 10)) %>%
  mutate(Puns = 0.5*BeardLength + Puns)

X

X %>% 
  ggplot(aes(x = BeardLength, y = Puns, col = Color)) +
    geom_point(fill = NA, pch = 16) +
    geom_smooth(aes(fill = Color), method = 'lm') +
    scale_color_manual(values = c("chocolate", "firebrick")) +
    scale_fill_manual(values = c("chocolate", "firebrick")) +
    # theme_bw() +
    # theme(panel.border = element_blank(), panel.grid.major = element_blank(),
    #       panel.grid.minor = element_blank(),
    #       axis.line = element_line(colour = "black")) +
  NULL
ggsave("./figs/Plot1.pdf", width = 3.25, height = 3, useDingbats = FALSE)

X %>%
  ggplot(aes(x = BeardLength, fill = Color)) +
  geom_density(alpha = 0.5, col = NA) +
  scale_fill_manual(values = c("chocolate", "firebrick"))
ggsave("./figs/Plot2.pdf", width = 3.25, height = 3)


