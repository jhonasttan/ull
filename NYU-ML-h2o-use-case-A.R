library(h2o)
h2o.init(nthreads = -1)
data <- h2o.importFile("groups-input-csv-original.csv")
typeof(data)
data <- h2o.importFile("groups-input-csv.csv")
dim(data)
y <- "group"
x <- setdiff(names(data),y)
parts <- h2o.splitFrame(data,0.7)
train <- parts[[1]]
test <- parts[[2]]
m <- h2o.deeplearning(x,y,train)
typeof(m)
plot(m)
summary(m)
p <- h2o.predict(m, test)
p
h2o.confusionMatrix(m)
p$predict
as.data.frame(p)
head(as.data.frame((h2o.cbind(p$predict, test$group))),10)

h2o.shutdown()
#Restart &amp; run with new data-set; interpret all results:

library( h2o)
h2o.init( nthreads = -1)
data  <- h2o.importFile("groups-input-csv.csv")

y <- "group"
x <- setdiff(names(data),y)
parts <-  h2o.splitFrame(data, 0.7)
train <- parts[[1]]
test <- parts[[2]]

m <- h2o.deeplearning( x, y, train)

p <- h2o.predict( m, test)

as.data.frame(p)

h2o.confusionMatrix(m)

as.data.frame( h2o.cbind(p$predict,test$group) )

h2o.shutdown()
