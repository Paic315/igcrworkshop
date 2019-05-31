download.file(
  "https://raw.githubusercontent.com/datacarpentry/R-genomics/gh-pages/data/Ecoli_metadata.csv",
  destfile = "data/ecoli"
)
metadata <- read.csv("data/ecoli", stringsAsFactors = FALSE)

library(ggplot2)

ggplot(metadata, aes(x=sample, y=genome_size, color=clade)) +
  geom_point() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


ggplot(metadata, aes(x=cit, y=genome_size, fill=cit))+ 
  scale_fill_manual(values = c("orange", "purple","green"))+
  theme(panel.grid.major=element_line(size=0.5, color="grey"))+
  geom_boxplot()+
  labs(x="citrate mutant type", y="Genome Size")




ggplot(metadata, aes(x=genome_size, fill=clade))+
  geom_histogram() +
  facet_wrap(~clade)



#animated plot
install.packages("gganimate")
library(gganimate)
theme_set(theme_bw())
install.packages("gifski")
library(gifski)


p <- ggplot(metadata, aes(x=sample, y=genome_size, color=clade)) +
  geom_point(show.legend = FALSE)

p+transition_time(generation) +
  labs (title = "Generations:{frame_time}")
  
  
  
  