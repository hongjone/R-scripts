getwd()
setwd("C:\\Users\\wongh\\Documents\\Work\\R")

movies <- read.csv("P2-Movie-Ratings.csv")

head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
tail(movies)
str(movies)
summary(movies)

# Making the year values recognised as factor
factor(movies$Year)
movies$Year <- factor(movies$Year)

summary(movies)

# Aesthetics
library(ggplot2)
 
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

# add geometry
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) +
   geom_point()

# add colour
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions)) +
  geom_point()

# This is #1 chart

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions)) +
  geom_point()

#------------------------

p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions)) +
  geom_point()

# point
p + geom_point()

# lines
p + geom_line()

# multiple layers
p + geom_line() + geom_point()

#------------------------
q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions)) +
  geom_point()

# add geom layer
q + geom_point()

# overridding aesthetic
# eg 1
q + geom_point(aes(size=CriticRating))

# eg 2
q + geom_point(aes(colour=BudgetMillions))

# q remains the same
q + geom_point()

# eg 3
q + geom_point(aes(x=BudgetMillions))

# eg 4
q + geom_line() + geom_point()

# reduce line size
q + geom_line(size=1) + geom_point()


#--------------------------
# Mapping vs Settings

# This is #2 chart
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions)) 
r + geom_point()

# Add colour
# 1 Mapping (for more complex cases use this, for mapping)
r + geom_point(aes(colour=Genre))
r + geom_point(aes(size=BudgetMillions))
# 2 Setting (for straightforward cases use this)
r + geom_point(colour="DarkGreen")
r + geom_point(size=10)

#-------------------------
# Histogram and Density Charts

s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth=10)
# add colour
s + geom_histogram(binwidth=10, aes(fill=Genre))
# add border
s + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")
# This is #3 chart

s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position="stack")


#------------------------
# Layer Tips
# eg. Good for you wanting to change a different plot, so you map it outside, then can do other plots

t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth=10, fill="White", colour="Blue")

# another way
t <- ggplot(data=movies)
t + geom_histogram(binwidth=10, aes(x=AudienceRating), fill="White", colour="Blue")
# eg. Good for you want to use a different data plot on the axis, then use this inside. More of convenience.
t + geom_histogram(binwidth=10, aes(x=CriticRating), fill="White", colour="Blue")


#------------------------
# Statistical Transformation

?geom_smooth

u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))
u + geom_point() + geom_smooth(fill=NA)

# boxplots
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating, colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
u + geom_boxplot(size=1.2) + geom_jitter()
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)
# This is #6 Chart


#------------------------------
# using facets

v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")


# facets
v + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") +
  facet_grid(Genre~., scales="free")

# scatterplots
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))
w + geom_point(size=3)

# facets
w + geom_point(size=3) + facet_grid(Genre~.)
w + geom_point(size=3) + facet_grid(.~Year)
w + geom_point(size=3) + facet_grid(Genre~Year)
w + geom_point(size=3) + geom_smooth() + facet_grid(Genre~Year)
w + geom_point(aes(size=BudgetMillions)) + geom_smooth() + facet_grid(Genre~Year)


#------------------------------
# Coordinates

m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, size=BudgetMillions, colour=Genre))

m + geom_point()

m + geom_point() + xlim(50, 100) + ylim(50, 100)
# won't work well always


n <-ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") + ylim(0,50)

# instead - zoom
n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") + coord_cartesian(ylim=c(0,50))

# improve above
w + geom_point(aes(size=BudgetMillions)) + geom_smooth() + facet_grid(Genre~Year) + coord_cartesian(ylim=c(0,100))



#-----------------------------
# Theme

o <- ggplot(data=movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

h

# axes label
h + 
  xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        
        plot.title = element_text(colour="Blue", size=30),)



