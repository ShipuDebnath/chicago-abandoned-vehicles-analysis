install.packages("leaflet")
install.packages("scales")
install.packages("plotly")
library(ggplot2)
library(lubridate)
library(leaflet)
library(scales)
library(plotly)
AbanCars = Abandoned_Vehicles_Map[, c(3, 7, 11, 13, 16, 19, 20)]
options(digits = 4, scipen = 9999)
AbanCars = AbanCars[complete.cases(AbanCars), ]
AbanCars$Date = AbanCars$'Completion Date'
AbanCars$Make = AbanCars$'Vehicle Make/Model'
AbanCars$DaysParked = AbanCars$'How Many Days Has the Vehicle Been Reported as Parked?'
AbanCars$ZIP = AbanCars$'ZIP Code'
AbanCars$'Completion Date' <- NULL
AbanCars$'Vehicle Make/Model' <- NULL
AbanCars$'How Many Days Has the Vehicle Been Reported as Parked?' <- NULL
AbanCars$'ZIP Code' <- NULL
AbanCars$Ward = factor(AbanCars$Ward)
AbanCars$Make = factor(AbanCars$Make)
AbanCars$ZIP = factor(AbanCars$ZIP)
AbanCars$Date <- as.Date(AbanCars$Date, "%m/%d/%Y")
View(AbanCars)
summary(AbanCars)
AbanCars = AbanCars[AbanCars$DaysParked > 0, ]
AbanCars = AbanCars[AbanCars$DaysParked <= 365, ]
summary(AbanCars)
set.seed(1112)
AbanCars$RanNum = runif(nrow(AbanCars))
AbanCars1Pct = AbanCars[AbanCars$RanNum <= 0.01, ]
summary(AbanCars1Pct)
ggplot(AbanCars1Pct, aes(x = DaysParked)) + geom_histogram(aes(y= ..density..), colour = "blue", fill = "darkred") + scale_y_continuous(labels= percent) + scale_x_continuous(breaks=seq(0, 365, 20)) + labs(title = "Number of Days Cars were Abandoned",x="Number of Days",y = "Percent") + theme_bw()
ggplot(AbanCars1Pct, aes(x = DaysParked)) + geom_density(alpha = 0.2, fill = "pink") + scale_y_continuous(labels=percent) + scale_x_continuous(breaks=seq(0, 365, 20)) + labs(title = "Number of DaysCars were Abandned",x="Number of Days",y= "Percent") + theme_classic()
Mostcommon = AbanCars1Pct[AbanCars1Pct$Ward %in% c("45", "36", "11"), ]
View(Mostcommon)
p1 = ggplot(Mostcommon, aes(x = Ward, y = DaysParked)) + geom_boxplot(color = "purple", fill = "lightblue") + theme_light()
p1
p2 = p1 + geom_jitter(alpha = 0.35, position = position_jitter(0.2), color = "red")
p2
p2 + labs(title = "Wards where cars are commonly abandoned", x = "Wards", y = "Number of Days")
Mostcommon$Month <- month(Mostcommon$Date, label = TRUE)
Mostcommon$month <- factor(Mostcommon$Month, levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))
plot_ly(Mostcommon, x = ~Month, y = ~DaysParked, color = ~Month, type = "box")
leaflet(data = AbanCars1Pct) %>% addTiles() %>% addCircleMarkers(~Longitude, color = "red",radius = ~1, popup = ~as.character(Make), label = ~as.character(Make))
