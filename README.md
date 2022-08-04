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

### Polynomial models

![](https://github.com/la6if9/Feature-space-expansions/blob/main/Rplot06.png)

adding the regression line of the polynomial model
![](https://github.com/la6if9/Feature-space-expansions/blob/main/Rplot08.png)

Smooth spline
![](https://github.com/la6if9/Feature-space-expansions/blob/main/Rplot09.png)
