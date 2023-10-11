#.... TASK 1 .....
/*Import Pandas as 'pd'.
Read the CSV file nasa.csv into a Pandas DataFrame named 'df'.
Inspect the data by calling the variable 'df'*/

  
#--- Import Pandas ---
import pandas as pd
#--- Read in dataset ----
df =  pd.read_csv('nasa.csv')
# ---WRITE YOUR CODE FOR TASK 1 ---
#--- Inspect data ---
df


#.... TASK 2 .....
/*Counting Null Values.
Use the isnull() function to mark null (missing) values in each column of the 'df' DataFrame.
Apply the sum() function to calculate the sum of these marked null values for each column and store the counts in a variable called 'null_values'.
Display 'null_values' to show the count of null values for each column in 'df'.*/

# --- WRITE YOUR CODE FOR TASK 2 ---
null_values=df.isnull().sum()
#--- Inspect data ---
null_values
