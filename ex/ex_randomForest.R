library(randomForest)

read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data", header = F) %>%
  mutate(V2 = factor(as.integer(V2)), V4 = factor(as.integer(V4)), V6 = factor(as.integer(V6)), 
         V7 = factor(as.integer(V7)), V8 = factor(as.integer(V8)), V9 = factor(as.integer(V9)),
         V10 = factor(as.integer(V10)), V14 = factor(as.integer(V14)), V15 = factor(as.integer(V15))) -> df.train

read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.test", header = F, skip = 1) %>%
  mutate(V2 = factor(as.integer(V2)), V4 = factor(as.integer(V4)), V6 = factor(as.integer(V6)), 
         V7 = factor(as.integer(V7)), V8 = factor(as.integer(V8)), V9 = factor(as.integer(V9)),
         V10 = factor(as.integer(V10)), V14 = factor(as.integer(V14)), V15 = factor(as.integer(V15))) -> df.test

ntree <- 10
model.rf <- randomForest(V15~., df.train, ntree = ntree, nodesize=5, maxnodes=16)

dir.create('ex/forest', showWarnings = FALSE)
for (t in 1:ntree) {
  out <- capture.output(getTree(model.rf, k=t))
  cat(out,file=sprintf('ex/forest/tree%03d.txt', t),sep="\n",append=FALSE)
}