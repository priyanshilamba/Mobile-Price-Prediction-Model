# Mobile Price Prediction




## Project Overview
This project aims to predict mobile phone price ranges using machine learning models. We experimented with three different models and selected Random Forest based on its superior accuracy. The dataset consists of various numerical and categorical features, which were cleaned and processed before training the models.
## Data Description
The dataset includes mobile specifications as input features and a price range (0: Low, 1: Medium, 2: High, 3: Very High) as the target variable.

Features:
- Categorical Variables: Bluetooth, WiFi, 4G, 3G, Touchscreen, Dual SIM.
- Numerical Variables: RAM, Battery Power, Processor Speed, Camera Resolution, Pixel Dimensions, etc.
## Data Processing and Cleaning
Before training, the data underwent:
- Handling missing values (if any).
- Feature scaling and normalization where necessary.
- Encoding categorical variables into numerical format.
-  Splitting data into training and testing sets (80-20 split).
## Model Selection and Comparision
Three models were tested:

- Logistic Regression – Rejected due to low accuracy (~78%) and inability to capture complex relationships.
- Decision Tree – Performed better but showed overfitting and had less generalization power.
- Random Forest – Best model with 92.5% accuracy, low misclassification rates, and better handling of feature importance.
## Final Model: Random Forest
- Algorithm: Random Forest Classifier
- Number of Trees: 500
- Feature Selection: 10 variables per split

Performance Metrics:
- Accuracy: 92.5%
- Kappa Score: 0.9 (high agreement)
- Sensitivity & Specificity: Above 87% for all classes
- Balanced Accuracy: Consistently high across price categories

Feature Importance Analysis: 

- RAM is the most critical factor affecting price.
- Battery power, display resolution, and internal memory also play a significant role.
## Usage
- Prepare data by following preprocessing steps.
- Train the model using the provided Random Forest configuration.
- Make predictions by inputting mobile specifications.
## Conclusion
The Random Forest model outperformed other approaches, providing a highly accurate and interpretable solution for mobile price prediction. Future improvements can include real-time market trends, additional features, and hyperparameter tuning.
