
#### PLOTS #############################################################################################################

opacity = 0.6
color = 'darkblue'

ggplot(no_of_np, aes(year, val_mln)) +
  geom_col(alpha = opacity, fill = color) +
  geom_text(aes(label = val_mln), vjust = 2, color = 'white', size = 3) +
  scale_y_continuous(labels = scales::number, breaks = seq(0, 3, 0.5)) +
  ylab('Natural Persons') +
  xlab('Year') +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5),
        panel.grid.major.x = element_blank())


ggplot(no_of_new_np, aes(year, val_mln)) +
  geom_col(alpha = opacity, fill = color) +
  geom_text(aes(label = val_mln), vjust = 2, color = 'white', size = 3) +
  scale_y_continuous(labels = scales::number) +
  ylab('Natural Persons') +
  xlab('Year') +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5),
        panel.grid.major.x = element_blank())


ggplot(no_of_rem_np, aes(year, val_mln)) +
  geom_col(alpha = opacity, fill = color) +
  geom_text(aes(label = val_mln), vjust = 2, color = 'white', size = 3) +
  scale_y_continuous(labels = scales::number) +
  ylab('Natural Persons') +
  xlab('Year') +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5),
        panel.grid.major.x = element_blank())


ggplot(no_of_np_per1000, aes(year, val)) +
  geom_col(alpha = opacity, fill = color) +
  geom_text(aes(label = val), vjust = 2, color = 'white', size = 3) +
  scale_y_continuous(labels = scales::number) +
  ylab('Natural Persons') +
  xlab('Year') +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5),
        panel.grid.major.x = element_blank())


ggplot(no_of_np_per100_work, aes(year, val)) +
  geom_col(alpha = opacity, fill = color) +
  geom_text(aes(label = val), vjust = 2, color = 'white', size = 3) +
  scale_y_continuous(labels = scales::number) +
  ylab('Natural Persons') +
  xlab('Year') +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5),
        panel.grid.major.x = element_blank())
