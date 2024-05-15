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
library(ggplot2)

# Create a bar plot
ggplot(shark_data, aes(x = State, y = `Shark common name`)) +
  geom_bar(colour= class) +
  geom_smooth(se=FALSE) +
  labs(title = "Shark Incidents by State",
       x = "State",
       y = "Shark Common Name"
  )
 
