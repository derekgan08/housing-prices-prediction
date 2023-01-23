# Principles of Data Analytics Project: Housing Prices Prediction

## Problem Statements
Predicting housing prices is a critical task for understanding market trends and making informed investment decisions. This project uses nominal and rent price data across different locations to build a model that forecasts housing prices. 

## Project Overview
This project leverages data preprocessing, feature scaling, and machine learning techniques to predict housing prices using nominal and rent data. The dataset includes prices across multiple locations and time periods, with a focus on data cleaning, handling missing values, and performing exploratory data analysis (EDA). Various models, including clustering with k-means, are employed to uncover insights about housing price trends.

Key features of the project include:
- Handling and cleaning of real-world data
- Time series data analysis for price prediction
- K-means clustering for identifying market patterns
- Visualizations including bar plots, box plots, and correlation plots for better data understanding

This project can be used by real estate professionals, data scientists, or analysts who aim to gain insights into housing price trends and build predictive models.

## Key Features
- **Data Preprocessing**: Removal of irrelevant columns, handling missing data, and feature scaling.
- **Exploratory Data Analysis (EDA)**: Visualizations using ggplot2, box plots, and correlation analysis.
- **Machine Learning**: K-means clustering for identifying patterns in housing prices across different locations and time.
- **Time Series Analysis**: Focusing on quarterly data to understand trends and predict future values.

## Technologies Used
- **R Programming Language** for data processing and visualization
- **ggplot2** for data visualization
- **caTools** for data splitting
- **Hmisc** and **corrplot** for correlation analysis
- **k-means** clustering for unsupervised learning

## Data Preparation
### Data Preparation and Preprocessing
1.  **Original Dataset:**
    <p align="center">
    <img src="readme-assets/01 Original Dataset.png" alt="original dataset"/>
    <br>
    <i>Figure 1: Original dataset</i>
    </p>

2.  **Dataframe that Have Undergone Preprocessing:**
    <p align="center">
    <img src="readme-assets/02 Dataframe that Have Undergone Preprocessing.png" alt="dataframe that have undergone preprocessing"/>
    <br>
    <i>Figure 2: Dataframe that have undergone preprocessing</i>
    </p>

    Figure 1 shows the data read from csv and stored into dataframe, df. It contains 698 entries with 8 columns. Figure 2 shows the dataframe df that have undergone preprocessing. It has 90 entries with 10 total columns now.

3.  **Locations and Total Numbers of Missing Values:**
    <p align="center">
    <img src="readme-assets/03 Locations and Total Numbers of Missing Values.png" alt="locations and total numbers of missing values"/>
    <br>
    <i>Figure 3: Locations and total numbers of missing values</i>
    </p>

4.  **Structure of the Dataframe Before Preprocessing:**
    <p align="center">
    <img src="readme-assets/04 Structure of the Dataframe Before Preprocessing.png" alt="structure of the dataframe before preprocessing"/>
    <br>
    <i>Figure 4: Structure of the dataframe before preprocessing</i>
    </p>

5.  **Structure of the Dataframe After Preprocessing:**
    <p align="center">
    <img src="readme-assets/05 Structure of the Dataframe After Preprocessing.png" alt="structure of the dataframe after preprocessing"/>
    <br>
    <i>Figure 5: Structure of the dataframe after preprocessing</i>
    </p>

6.  **First Few Rows of the Dataframe for df3, Training_Set and Test_Set:**
    <p align="center">
    <img src="readme-assets/06 First Few Rows of the Dataframe for df3, Training_Set and Test_Set.png" alt="first few rows of the dataframe for df3, training_set and test_set"/>
    <br>
    <i>Figure 6: First few rows of the dataframe for df3, training_set and test_set</i>
    </p>

7.  **Summary of the Dataframe for df3, Training_Set and Test_Set:**
    <p align="center">
    <img src="readme-assets/07 Summary of the Dataframe for df3, Training_Set and Test_Set.png" alt="summary of the dataframe for df3, training_set and test_set"/>
    <br>
    <i>Figure 7: Summary of the dataframe for df3, training_set and test_set</i>
    </p>

8.  **Training Set for Housing_Prices After Preprocessing:**
    <p align="center">
    <img src="readme-assets/08 Training Set for Housing_Prices After Preprocessing.png" alt="training set for housing_prices after preprocessing"/>
    <br>
    <i>Figure 8: Training set for housing_prices after preprocessing</i>
    </p>
    Figure 8 shows the training set. It has 72 entries with 9 columns.

9.  **Test Set for Housing_Prices After Preprocessing:**
    <p align="center">
    <img src="readme-assets/09 Test Set for Housing_Prices After Preprocessing.png" alt="test set for housing_prices after preprocessing"/>
    <br>
    <i>Figure 9: Test set for housing_prices after preprocessing</i>
    </p>
    Figure 9 shows the test set. It has 18 entries with 10 columns. The preprocessed dataframe is split into training and test set with the ratio of 0.8 and 0.2 respectively.

### Exploratory Data Analysis (EDA)
1.  **Barplot for the Value of Nominal and Rent Housing Prices by Locations in 2020-Q4:**
    <p align="center">
    <img src="readme-assets/10 Barplot for the Value of Nominal and Rent Housing Prices by Locations in 2020-Q4.png" alt="barplot for the value of nominal and rent housing prices by locations in 2020-q4"/>
    <br>
    <i>Figure 10: Barplot for the value of nominal and rent housing prices by locations in 2020-q4</i>
    </p>

2.  **Boxplot for the Housing Value Prices by Months for Nominal and Rent:**
    <table>
    <tr>
        <td style="text-align: center;">
        <img src="readme-assets/11 Boxplot for the Housing Value Prices by Months for Nominal.png" alt="boxplot for the housing value prices by months for nominal" />
        <br>
        <i>Figure 11: Boxplot for the housing value prices by months for nominal</i>
        </td>
        <td style="text-align: center;">
        <img src="readme-assets/12 Boxplot for the Housing Value Prices by Months for Rent.png" alt="boxplot for the housing value prices by months for rent" />
        <br>
        <i>Figure 12: Boxplot for the housing value prices by months for rent</i>
        </td>
    </tr>
    </table>

3.  **Correlation Value and the P-Value of Nominal and Rent:**
    <p align="center">
    <img src="readme-assets/13 Correlation Value and the P-Value of Nominal and Rent.png" alt="correlation value and the p-value of nominal and rent"/>
    <br>
    <i>Figure 13: Correlation value and the p-value of nominal and rent</i>
    </p>

4.  **Correlation Value and the P-Value of Nominal Only:**
    <p align="center">
    <img src="readme-assets/14 Correlation Value and the P-Value of Nominal Only.png" alt="correlation value and the p-value of nominal only"/>
    <br>
    <i>Figure 14: Correlation value and the p-value of nominal only</i>
    </p>

5.  **Correlation Value and the P-Value of Rent Only:**
    <p align="center">
    <img src="readme-assets/15 Correlation Value and the P-Value of Rent Only.png" alt="correlation value and the p-value of rent only"/>
    <br>
    <i>Figure 15: Correlation value and the p-value of rent only</i>
    </p>

6.  **Correlaltion Plot for the Value of Nominal and Rent, Nominal Only, and Rent Only:**
    <table>
    <tr>
        <td style="text-align: center;">
        <img src="readme-assets/16 Correlation Plot for the Value of Nominal and Rent.png" alt="correlation plot for the value of nominal and rent"/>
        <br>
        <i>Figure 16: Correlation plot for the value of nominal and rent</i>
        </td>
        <td style="text-align: center;">
        <img src="readme-assets/17 Correlation Plot for the Value of Nominal Only.png" alt="correlation plot for the value of nominal only"/>
        <br>
        <i>Figure 17: Correlation plot for the value of nominal only</i>
        </td>
        <td style="text-align: center;">
        <img src="readme-assets/18 Correlation Plot for the Value of Rent Only.png" alt="correlation plot for the value of rent only"/>
        <br>
        <i>Figure 18: Correlation plot for the value of rent only</i>
        </td>
    </tr>
    </table>


## Prediction of the Housing Prices Hotspot Location to Invest via Clustering
We picked k-means clustering for the clustering model since it is good for huge datasets and 
has a low time complexity. The variables index in 2022 Q1, Q2, and Q3 are selected for this 
cluster model to identify where is the best location to invest. With the aid of Within Sum of 
Squares (WSS), the ideal k-value was established to be 10.

**Graph of Squares against Number of Clusters:**
    <p align="center">
    <img src="readme-assets/19 Graph of Squares Against Number of Clusters.png" alt="graph of squares against number of clusters"/>
    <br>
    <i>Figure 19: Graph of squares against number of clusters</i>
    </p>

The between SS/total SS ratio percentage for the clustering model is 96.4%, indicating that it has both internal cohesiveness and exterior separation. The centroids are close to the data points within the clusters, while each cluster is far from the others. Cluster graphs are displayed in the figures below.

1.  **km within ss, Total of km within ss and km Between ss:**
    <p align="center">
    <img src="readme-assets/20 km Within ss, Total of km Within ss and km Between ss.png" alt="km within ss, total of km within ss and km between ss"/>
    <br>
    <i>Figure 20: km within ss, total of km within ss and km between ss</i>
    </p>

2.  **between_ss/total_ss Ratio:**
    <p align="center">
    <img src="readme-assets/21 Between ss over Total ss Ratio.png" alt="between ss over total ss ratio"/>
    <br>
    <i>Figure 21: between_ss/total_ss ratio</i>
    </p>

3.  **Clusters Graphs of 2022-Q1, 2022-Q2 and 2022-Q3**
    <table>
    <tr>
        <td style="text-align: center;">
        <img src="readme-assets/22 Clusters Graphs of 2022-Q1.png" alt="clusters graphs of 2022-q1"/>
        <br>
        <i>Figure 22: Clusters graphs of 2022-Q1</i>
        </td>
        <td style="text-align: center;">
        <img src="readme-assets/23 Clusters Graphs of 2022-Q2.png" alt="clusters graphs of 2022-q2"/>
        <br>
        <i>Figure 23: Clusters graphs of 2022-Q2</i>
        </td>
        <td style="text-align: center;">
        <img src="readme-assets/24 Clusters Graphs of 2022-Q3.png" alt="clusters graphs of 2022-q3"/>
        <br>
        <i>Figure 24: Clusters graphs of 2022-Q3</i>
        </td>
    </tr>
    </table>

    From the figure above we can see that the hotspots with the highest index value are location around 15-25.