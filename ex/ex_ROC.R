## ROC 曲線の描き方
## 2015.06.27 gingi99

library(ggplot2)
library(ROCR)

# データ作成
diamonds$is_expensive <- diamonds$price > 2400
is_test <- runif(nrow(diamonds)) > 0.75
train <- diamonds[is_test==FALSE,]
test <- diamonds[is_test==TRUE,]

# モデル作成
summary(fit <- glm(is_expensive ~ carat + cut + clarity, data=train))

# 予測確率
prob <- predict(fit, newdata=test, type="response")

# step 1 : 値と属するグループをprediction関数にいれる
pred <- prediction(prob, test$is_expensive)

# step 2 : ROC曲線を描くための基本的なプロットをする（横軸がfalse positive rate, 縦軸がtrue positive rate）
perf <- performance(pred, measure = "tpr", x.measure = "fpr")

# step 3 : 描画
plot(perf)

# aucの値
auc <- performance(pred, measure = "auc")
auc <- auc@y.values[[1]]

# ggplotで描画
roc.data <- data.frame(fpr=unlist(perf@x.values),
                       tpr=unlist(perf@y.values),
                       model="GLM")
ggplot(roc.data, aes(x=fpr, ymin=0, ymax=tpr)) +
  geom_ribbon(alpha=0.2) +
  geom_line(aes(y=tpr)) +
  ggtitle(paste0("ROC Curve w/ AUC=", auc))
