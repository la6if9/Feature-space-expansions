library(ggplot2)
library(gamlss)
library(splines)
library(rpart)
library(caret)
set.seed(1)

#####BMI

ggplot(dbbmi, aes(x = age, y = bmi)) +
  geom_point(alpha = 0.2) + 
  geom_line(aes(y=fitted(lm(bmi ~ poly(age, degree = 14)))), col="red", size =1) +
  geom_line(aes(y = fitted(lm(bmi ~ bs(age, df = 8)))), col="green", size = 1) + 
  geom_line(aes(y = fitted(lm(bmi ~ ns(age, df = 8)))), col="blue", size = 1) + 
  geom_line(aes(y = fitted(lm(bmi ~ bs(age, knots = 0.4)))), col = "orange", size = 1) + 
  theme_minimal()


#####Fortune500 data

load(url("https://surfdrive.surf.nl/files/index.php/s/bvQsxVSsLhPgMmY/download"))

(p <- ggplot(Fortune500, aes(Profits, Assets)) +
    geom_point(alpha = .2, col="red") +
    theme_minimal()
)

anova(lm(Assets ~ poly(Profits, 1), Fortune500),
      lm(Assets ~ poly(Profits, 2), Fortune500),
      lm(Assets ~ poly(Profits, 3), Fortune500),
      lm(Assets ~ poly(Profits, 4), Fortune500))

(p <- p + geom_smooth(method = "lm", se = F, formula = y  ~ poly(x, 4)))

train(Assets ~ poly(Profits, 1), data = Fortune500,
      method = "lm",
      trControl = trainControl(method = "cv")
)
train(Assets ~ poly(Profits, 2), data = Fortune500,
      method = "lm",
      trControl = trainControl(method = "cv")
)
train(Assets ~ poly(Profits, 3), data = Fortune500,
      method = "lm",
      trControl = trainControl(method = "cv")
)
train(Assets ~ poly(Profits, 4), data = Fortune500,
      method = "lm",
      trControl = trainControl(method = "cv")
)

(p <- p + geom_smooth(method = "lm", se = F, formula = y ~ x, col = "green"))

sp <- smooth.spline(x = Fortune500$Profits, y = Fortune500$Assets)

pred_sp <- predict(sp, Fortune500$Profits)

(p <- p + geom_line(aes(Profits, pred_sp$y), col = "orange", size  = 1) )


#####Regression trees


tree <- rpart(Assets ~ Profits, data = Fortune500, 
              method = "anova")
plot(tree, margin=.5)
text(tree)

tree_cv <- train(Assets ~ Profits, 
                 data = Fortune500, 
                 method = "rpart",
                 trControl = trainControl(method = "cv"))
pred_tree_cv <- predict(tree_cv, Fortune500)
(p <- p + geom_line(aes(Profits, pred_tree_cv), col = "purple", size = 1) )


#KNN

(knn_cv <- train(Assets ~ Profits, 
                 data = Fortune500, 
                 method    = "knn",
                 tuneGrid  = expand.grid(k = c(5, 7, 9, 11, 15, 20, 25, 30)),
                 trControl = trainControl(method = "cv", number = 5))
)
fitted_knn_cv <- predict(knn_cv)
p + geom_line(aes(Profits, fitted_knn_cv), col = "brown", size = 1) 
