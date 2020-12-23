# Author: Yewshen Lim (y.lim20@imperial.ac.uk)
# Script: timelinechar.R
# Created: Dec 2020
#
# Script plots a gantt chart for the project

library(ggplot2)

timeline <- data.frame(Tasks = c('Data exploration',
                                 'Introduction write-up',
                                 'Model training',
                                 'Model application',
                                 'Output analysis',
                                 'Methods write-up',
                                 'Results and final write-up'),
                       Month = c(1, 1, 1.5, 2.5, 3, 4.5, 5),
                       end = c(1.5, 3, 2.5, 3, 5, 5.5, 8),
                       Component = c('Computational',
                                     'Writing',
                                     'Computational',
                                     'Computational',
                                     'Computational',
                                     'Writing',
                                     'Writing'))

gnt <- ggplot(timeline,
              aes(x = Month, xend = end, y = Tasks, 
                  yend = Tasks, color = Component)) +
       theme_bw() +
       theme(plot.title = element_text(size = 0),
             axis.title = element_text(size = 9),
             axis.text = element_text(size = 7),
             legend.key.size = unit(2, 'mm'),
             legend.title = element_text(size = 8),
             legend.text = element_text(size = 7)) +
       geom_segment(size = 6) +
       labs(title = 'Project timeline')

ggsave("timelinechart.pdf",
       plot = gnt,
       device = pdf(),
       width = 5,
       height = 2,
       dpi = 320)
