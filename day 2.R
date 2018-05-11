# Day 2 Conditional statements, functions, ggplot

# conditional statements

number <- 37
if (number > 100){         # if condition is true
  print("greater than 100") # perform this function
}else {                    # if condition is false
  print("less than 100")    # perform alternative action
}
print("finished checking")

#comparison operators:

# greater than >
# less than <
# equal to == (= is simply assignment operator/<-)
# not equal to !=
# >= or <= (greater/less and equal to)

number <- 150
if (number > 100){         # if condition is true
  print("greater than 100") # perform this function
} #without else statement and number < 100, doesn't know what to do so important to include even if optional

number <- -3

if (number > 0){
  print(1)
} else if (number < 0){
  print(-1)
}else{
  print(0)
}

# combine tests
number1 <- -15
number2 <- -40

# and
if (number1 >= 0 & number2 >= 0){
  print("both numbers are positive")
}else{
  print("at least one is negative")
}

# or/|

if (number1 >= 0 | number2 >=0){
  print("at least one number is positive")
} else {
  print("both numbers are negative")
}

# creating and using functions

fahr_to_kelvin <- function(temp){         #argument = temp
  kelvin <- ((temp - 32) * 5/9) + 273.15  #inside curly braces is function itself
  return(kelvin) #return not necessary in R but may need it in other programming languages
}

fahr_to_kelvin(32) #freezing point

fahr_to_kelvin(212) #boiling point

kelvin_to_celsius <- function(temp){
  celsius <- temp - 273.15
}

kelvin_to_celsius(0)

# variable scope: any variables define in function stay in function (in curly braces), not taken out
# less likely to overwrite something in environment

# mix and match functions

fahr_to_celsius <- function(temp){
  temp_k <- fahr_to_kelvin(temp)
  temp_c <- kelvin_to_celsius(temp_k)
  return(temp_c)
}

fahr_to_celsius(32)
fahr_to_celsius(68)

# nesting function
kelvin_to_celsius(fahr_to_kelvin(32))

celsius_to_fahr <- function(temp){
  fahr <- (temp * (9/5)) + 32
  return(fahr)
}

celsius_to_fahr(30)


# making reproducible graphics

library(ggplot2)

#read in some data
read.csv(file = "data/gapminder-FiveYearData.csv")
head(gap)
str(gap)

plot(x = gap$gdpPercap, y = gap$lifeExp)

# ggplot image

ggplot(data = gap, aes(x = gdpPercap, y = lifeExp)) +   # since already specify data, don't need to do "gap$" as above)
  scale_x_log10()+     # log scale
  geom_point(alpha = 0.5)+ # geometry of point, tells what kind of plot we want - point data
  geom_smooth(method = "lm", size = 2)+ #trend line and change thickness of line
  theme_bw()+
  ggtitle("Effects of per Capita GDP on Life Expectancy")+
  xlab("GDP per capita ($)")+ # add labels to axes
  ylab("Life Expectancy (yrs)")

ggsave(file = "results/life_expectancy.jpeg")
?ggsave # help on how you can save an image

# adding alpha makes points semi-transparent

ggplot(data = gap, aes(x = year, y = lifeExp)) +
  geom_point()

ggplot(data = gap, aes(x = year, y = lifeExp, by = country))+
  geom_line(aes(color = continent))+
  geom_point(color = "blue")      # need quotes around specified color

#faceting
ggplot(data = gap, aes(x = gdpPercap, y = lifeExp, color = continent))+
  geom_point()+
  scale_x_log10()+
  geom_smooth(method = "lm")+
  facet_wrap(~year) # separate points by year recorded, do by other variable after ~
