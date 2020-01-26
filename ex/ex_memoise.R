library(memoise)
set.seed(42)

load_data <- function(start_date, end_date){
  
  # Preprocess
  Sys.sleep(5)
    
  # return data
  data <- rnorm(end_date - start_date, mean = 0, sd = 1)
  data
}

t <- proc.time()
data <- load_data(as.Date("2019-08-01"), as.Date("2019-08-31"))
(proc.time() - t)["elapsed"]

fc <- cache_filesystem("~/tmp")
m_load_data <- memoise(load_data, cache = fc)

t <- proc.time()
data <- m_load_data(as.Date("2019-08-01"), as.Date("2019-08-31"))
(proc.time() - t)["elapsed"]

t <- proc.time()
data <- m_load_data(as.Date("2019-08-01"), as.Date("2019-08-31"))
proc.time() - t

