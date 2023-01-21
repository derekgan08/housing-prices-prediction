##### Part 1: Data Preprocessing #####
### Step 1: Importing the dataset

# Set the working directory
# setwd()

# Read a CSV files using read.csv() function
df <- read.csv("Housing_Prices.csv")

### Step 2: Remove Irrelevant Columns
# The column "INDICATOR" is removed because it is not important
df = subset(df, select = -c(INDICATOR))
# The column "SUBJECT" is removed because it is not important
# df = subset(df, select = -c(SUBJECT))
# The column "MEASURE" is removed because it is not important
df = subset(df, select = -c(MEASURE))
# The column "FREQUENCY" is removed because it is not important
df = subset(df, select = -c(FREQUENCY))
# The column "Flag Codes" is removed because it is an empty column
df = subset(df, select = -c(Flag.Codes))

### Step 3: Combine Rows that have similar attributes
# Split NOMINAL and RENT into 2 df
df1 <- subset(df, SUBJECT == "NOMINAL")
df2 <- subset(df, SUBJECT == "RENT")

library(tidyverse)
df1 <- df1[1:nrow(df1), c(1,3,4)] %>%  spread(key=TIME, value=Value)
df2 <- df2[1:nrow(df2), c(1,3,4)] %>%  spread(key=TIME, value=Value)

library(tibble)
df1 <- add_column(df1, SUBJECT = "NOMINAL", .after = "LOCATION")
df2 <- add_column(df2, SUBJECT = "RENT", .after = "LOCATION")

### Step 4: Handling the missing data
# Calculate the mean value for missing data
for(i in 3:ncol(df1)){
  df1[[i]] = ifelse(is.na(df1[[i]]),
                    ave(df1[[i]], FUN = function (x)mean(x, na.rm = TRUE)),
                    df1[[i]])
}
for(i in 3:ncol(df2)){
  df2[[i]] = ifelse(is.na(df2[[i]]),
                    ave(df2[[i]], FUN = function (x)mean(x, na.rm = TRUE)),
                    df2[[i]])
}

# Since NOMINAL does not have 2022-Q4, append NA to it
df1 <- add_column(df1, "2022-Q4" = NA, .after = "2022-Q3")

df <- rbind(df1, df2)

# finds the locations of missing values
which(is.na(df))

# finds the count of missing values
sum(is.na(df))

# The column "2022-Q4" is removed because empty for NOMINAL
df = subset(df, select = -c(`2022-Q4`))
df1 = subset(df1, select = -c(`2022-Q4`))
df2 = subset(df2, select = -c(`2022-Q4`))
which(is.na(df))
sum(is.na(df))

# Copy df into df3 because df is used in EDA while df3 is used in Feature Scaling
df3 <- df

### Step 5: Encoding categorical data
# To see the structure of the dataframe (before)
str(df3)

# Convert the data type into factor
df3$LOCATION = factor(df3$LOCATION,
                            c(df3[, 1]),
                            labels = seq(1, nrow(df3), by=1)
                            )
df3$LOCATION = as.factor(df3$LOCATION)
df3$SUBJECT = factor(df3$SUBJECT,
                    levels = c(unique(df3$SUBJECT)),
                    labels = seq(1, length(unique(df3$SUBJECT)), by=1)
)
df3$SUBJECT = as.factor(df3$SUBJECT)


### Step 6: Splitting the dataset into the training and test set

library(caTools) # required library to split data
set.seed(123) # Setting the seed to obtain the same random splitting set
# returns true if observation goes to the Training set and 
# false if observation goes to the test set.
split = sample.split(df3$SUBJECT, SplitRatio = 0.8)

# Creating the training set and test set separately
training_set = subset(df3, split == TRUE)
test_set = subset(df3, split == FALSE)


### Step 7: Feature scaling
training_set[, 3:10] = scale(training_set[, 3:10])
test_set[, 3:10] = scale(test_set[, 3:10])

# To see the structure of the dataframe (after)
str(df3)

# View the first few rows of the dataframe
head(df3)
head(training_set)
head(test_set)

# Print the summary of the dataframe
summary(df3)
summary(training_set)
summary(test_set)

################################################################################
##### Part 2: Exploratory Data Analysis(EDA) #####
### Visualising the data:
ylabel = 'Value'
xlabel = 'Locations'

## a. Barplot for Nominal Housing Prices:
titlelabel = 'Nominal'
plot1 = ggplot(data=df1,aes(x=reorder(LOCATION,`2020-Q4`),y=`2020-Q4`,fill=x)) + 
  geom_bar(stat ='identity',aes(fill=`2020-Q4`))+
  coord_flip() + 
  theme_grey() + 
  scale_fill_gradient(name="Value Level")+
  ggtitle(titlelabel)+
  ggeasy::easy_center_title()+
  theme(plot.title = element_text(face = "bold"))+
  labs(y=ylabel,x=xlabel) +
  geom_hline(yintercept = mean(df1$"2020-Q4"),size = 1, color = 'blue')
## a. Barplot for Rent Housing Prices:
titlelabel = 'Rent'
plot2 = ggplot(data=df2,aes(x=reorder(LOCATION,`2020-Q4`),y=`2020-Q4`,fill=x)) + 
  geom_bar(stat ='identity',aes(fill=`2020-Q4`))+
  coord_flip() + 
  theme_grey() + 
  scale_fill_gradient(name="Value Level")+
  ggtitle(titlelabel)+
  ggeasy::easy_center_title()+
  theme(plot.title = element_text(face = "bold"))+
  labs(y=ylabel,x=xlabel) +
  geom_hline(yintercept = mean(df2$"2020-Q4"),size = 1, color = 'blue')
# To combine both plots on the same diagram:
library(gridExtra)
library(ggpubr)
grid.arrange(plot1, plot2, nrow = 1,
             top = text_grob('Barplot for the Value of Nominal and Rent Housing Prices by Locations in 2020-Q4', face = "bold"),
             bottom = ''
)


## b. Separated Boxplot:
df4 = df[,c(1,2,3,4,5,6,7,8,9,10)] %>%   # select relevant columns 
  pivot_longer(c(3,4,5,6,7,8,9,10),names_to = 'MONTHS')
# Change the number in unique(df4$SUBJECT)[] to toggle between Nominal and Rent. Nominal is [1]; Rent is [2]
subject = unique(df4$SUBJECT)[2]
titlelabel = paste('Boxplot for the Housing Prices Value by Months for', subject)
df4 = df[,c(1,2,3,4,5,6,7,8,9,10)] %>%   # select relevant columns 
  pivot_longer(c(3,4,5,6,7,8,9,10),names_to = 'MONTHS')
ggplot(data = filter(df4,SUBJECT==subject), aes(x=MONTHS,y=value, color=MONTHS)) +
  geom_boxplot()+
  scale_fill_brewer(palette="Dark2") + 
  geom_jitter(shape=16, position=position_jitter(0.2))+
  ggtitle(titlelabel)+
  ggeasy::easy_center_title()+
  theme(plot.title = element_text(face = "bold"))+
  labs(y=ylabel,x=xlabel)

## b. Combined Boxplot:
titlelabel = 'Boxplot for the Value of Housing Prices by Locations'
ggplot(data = df4, aes(x=MONTHS,y=value, color=MONTHS)) + 
  geom_boxplot()+
  scale_fill_brewer(palette="Dark2") + 
  geom_jitter(shape=16, position=position_jitter(0.2))+
  ggtitle(titlelabel)+
  ggeasy::easy_center_title()+
  theme(plot.title = element_text(face = "bold"))+
  labs(y=ylabel,x=xlabel)+
  facet_wrap(~SUBJECT,nrow = 1)

## c. Correlation Plot:
library("Hmisc")
library(corrplot)
# Run this statement if you want all corrplot to be displayed together
par(mfrow=c(2,2))

res = cor(df[,-1:-2]) # -1:-2 here means we look at all columns except the first two columns
res
res2 <- rcorr(as.matrix(df[,-1:-2]))
res2
corrplot(res, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45, mar=c(0,0,2,0), title = "Correlation Plot for the Value of Nominal and Rent")

res = cor(df1[,-1:-2]) # -1:-2 here means we look at all columns except the first two columns
res
res2 <- rcorr(as.matrix(df1[,-1:-2]))
res2
corrplot(res, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45, mar=c(0,0,2,0), title = "Correlation Plot for the Value of Nominal Only")

res = cor(df2[,-1:-2]) # -1:-2 here means we look at all columns except the first two columns
res
res2 <- rcorr(as.matrix(df2[,-1:-2]))
res2
corrplot(res, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45, mar=c(0,0,2,0), title = "Correlation Plot for the Value of Rent Only")

#############################################################
##### Part 3: Clustering #####
# Apply a heuristic that uses the Within Sum of Squares (WSS) metric
# to determine a reasonably optimal value of k
# training_set = training_set[, 3:11]
training_set = subset(training_set, select = -c(SUBJECT))
training_set
wss <- numeric(15)
for (k in 1:15) 
  wss[k] <- sum(kmeans(training_set, centers=k, nstart=25)$withinss)

# Using the basic R plot function, each WSS is plotted against
# the respective number of centroids, 1 through 15
plot(1:15, wss, type="b", xlab="Number of Clusters", ylab="Within Sum of
Squares")

# Apply k-means Clustering and view the results
km <- kmeans(training_set, 10, nstart=50)
km$withinss
km$tot.withinss
km$betweenss
# View the number of data points in each cluster
table(km$cluster)
# Plot to see the distribution of Location and 2022-Q1 data points in clusters
plot(training_set[c(7,1)], col=km$cluster)
# Plot to see the distribution of Location and 2022-Q2 data points in clusters
plot(training_set[c(8,1)], col=km$cluster)
# Plot to see the distribution of Location and 2022-Q3 data points in clusters
plot(training_set[c(9,1)], col=km$cluster)