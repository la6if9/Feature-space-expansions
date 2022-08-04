# Feature-space-expansions
visualizing data, and fit polynomials, splines and regression trees.

## BMI data (Body Mass Index data set for this exercise is gamlss::dbbmi)

scatterplot with age on the x-axis and bmi on y-axis
![](https://github.com/la6if9/Feature-space-expansions/blob/main/Rplot.png)

previous plot with the regression line of a polynomial model
![](https://github.com/la6if9/Feature-space-expansions/blob/main/Rplot01.png)

previous plot with the regression lines of both a cubic and a natural cubic spline
![](https://github.com/la6if9/Feature-space-expansions/blob/main/Rplot02.png)

fitting a cubic spline with a single, well placed knot
![](https://github.com/la6if9/Feature-space-expansions/blob/main/Rplot03.png)

## Fortune500 data
The aim is to select the best model for predicting Assets from Profit. we perform a 10-fold cross-validation for each model using the entire sample, and select the model with the lowest cross-validated RMSE.


scatterplot with Assets on the y-axis and Profits on the x-axis
![](https://github.com/la6if9/Feature-space-expansions/blob/main/Rplot05.png)


### Polynomial model

linear, quadratic, cubic and quartic models

![](https://github.com/la6if9/Feature-space-expansions/blob/main/Rplot06.png)

adding the regression line of the polynomial model
![](https://github.com/la6if9/Feature-space-expansions/blob/main/Rplot08.png)

regression line (in orange) to the plot with the regression lines for the linear and quartic model.
![](https://github.com/la6if9/Feature-space-expansions/blob/main/Rplot09.png)

### Regression trees
A regression tree partitions the variable Profits in on-overlapping regions, and assigns mean of Assets within each region as predicted value.

![](https://github.com/la6if9/Feature-space-expansions/blob/main/Rplot10.png)

trees tend to overfit, so we perform cross-validation on the tree object to find the optimal value for the hyperparameter cp

scatter plot prediction, and adding the regression line of of the tree (in purple)
![](https://github.com/la6if9/Feature-space-expansions/blob/main/Rplot11.png)

### KNN

scatter plot, adding the KNN regression line of the tree (in brown).
![](https://github.com/la6if9/Feature-space-expansions/blob/main/Rplot12.png)
