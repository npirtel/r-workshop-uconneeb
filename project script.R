# Data Structures

#make a data frame

cats <-data.frame(coat = c("calico", "black", "tabby"),
                  weight = c(2.1, 5.0, 3.2),
                  likes_string = c(1, 0, 1))

write.csv(x = cats, file = "Data/feline_data.csv") #would want to put output in results folder

cats

cats$weight

cats$coat

cats$weight + 2

cats$weight + cats$coat

class(cats$weight)
class(cats$coat)

str(cats)
str(cats$coat)
cats$coat

# change order of factors
cats$coat_reorder <- factor(x = cats$coat,
                            levels = c("tabby", "calico", "black"),
                            ordered = TRUE)

str(cats$coat_reorder)
levels(cats$coat_reorder)

#Exploring Data Frames

# read in data
gap <- read.csv(file = "Data/gapminder-FiveYearData.csv")

cats <-read.csv(file = "Data/feline_data.csv")

head(gap) #display first 6 records of data

str(gap) #structure of records, what data type for each variable + overall frame

nrow(gap) #number rows
ncol(gap) #number columns
dim(gap) #number rows, number columns

colnames(gap)

#Subsetting data
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
x
names(x) <-c("a", "b", "c", "d", "e") #name vector
x

x[1] #functions of nth element from vector
x[3]

x[c(1, 3)] #need combine function for more than 1 output in list

#slices
x[1:4] #output for 1-4, indicate by ":"

x[-2] #negative indicate removing an output

x[-(2:4)] #not including 2-4

x[-2:-4] #this notation also works

# subsetting gapminder data

head(gap[1]) #square brackets for first column
head(gap["pop"])

head(gap[, 1]) #subset by column if on right of bracket

gap[3, ] #subset by row if on left of bracket

gap[138, ]

albania <- gap[13:24, 3:6]

afghanistan <- gap[1:12, 1:6] #name of subset of data <- [row:row, Column:column]

afghanistan$gdp <- afghanistan$pop * afghanistan$gdpPercap #use $ to create new column/vector

write.csv(afghanistan, "results/afghanistan.csv") #(data table name, "name of folder/table name.csv)

rm(afghanistangdp) #remove variable

afghanistan <- gap[1:12, ]

afghanistan$gdp <- afghanistan$pop * afghanistan$gdpPercap

