#Assignment: Plot Deconstruction (Assignment. Graphical Storytelling in R)

#Part 1. First, choose your data
# Read the CSV file and assign it to a variable named dataset
# Specify the file path of the CSV file
file_path <- "C:/Users/Danko Castaño Duro/Desktop/Australia 3 semestre/Modulos 1/INTRODUCTION TO R 4/MB5370_Mod04_Danko/MB5370_Mod04_Danko/Australian Shark-Incident Database Public Version (2).csv"

# Read the CSV file with specified parameters
data <- read.csv(file_path, header = TRUE, sep = ",", quote = "\"")

# Display the structure of the data
summary(data)


###########################PROBLEMS WITH DATA, LETS CORRECT IT

# Display the column names in the dataset
colnames(data)

# Splitting the data by semicolons
data_split <- strsplit(data[, 1], ";")

# Extracting State and Shark common name
states <- sapply(data_split, function(x) x[4])
shark_common_names <- sapply(data_split, function(x) x[5])

# Creating a new data frame with the selected columns
shark_data <- data.frame(State = states, `Shark common name` = shark_common_names)

# Displaying the first few rows of the selected data
head(shark_data)

#############################

# Load the ggplot2 library
library(tidyverse)

# Check the column names in shark_data
colnames(shark_data)

# Define the shark common names of interest
shark_names_of_interest <- c("white shark", "bull shark", "tiger shark")

# Create a new dataset with selected shark common names
selected_shark_data <- shark_data[shark_data$`Shark.common.name` %in% shark_names_of_interest, ]

# Display the first few rows of the new dataset
head(selected_shark_data)

selected_shark_data2 <- selected_shark_data %>% 
  mutate(name_fact = as.factor(`Shark.common.name`)) %>%
  mutate(namefact2 = fct_relevel(c("white shark", "tiger shark")))

summary(selected_shark_data2$name_fact)

# Create a bar plot
ggplot(selected_shark_data2, aes(x = State, fill = `Shark.common.name`)) +
  geom_bar() +
  labs(title = "Shark Incidents by State",
       x = "State",
       y = "Count",
       fill = "Shark Common Name") +
 # scale_fill_brewer(palette = 1) +
  scale_fill_manual(values = c( "brown","orange" , "white" )) +
  scale_y_continuous(breaks = seq(0, 300, by = 20)) 

