StTest <- function(formula, data, alpha = 0.05, na.rm = TRUE, verbose = TRUE) {

  dp=as.character(formula)
  DNAME <- paste(dp[[2L]], "and", dp[[3L]])

  METHOD <- "ST test"
  TEST <- "ST"

 if (na.rm){
    completeObs <- complete.cases(data)
    data <- data[completeObs,]
  }

if (any(colnames(data)==dp[[3L]])==FALSE) stop("The name of group variable does not match the variable names in the data. The group variable must be one factor.")
if (any(colnames(data)==dp[[2L]])==FALSE) stop("The name of response variable does not match the variable names in the data.")
y = data[, dp[[2L]]]
group = data[, dp[[3L]]]
if (!is.factor(group)) stop("The group variable must be a factor.")
if (!is.numeric(y)) stop("The response must be a numeric variable.")

n <- length(y)
x.levels <- levels(factor(group))
k<-NROW(x.levels)
aST=0;LST=0;
Cvar=0;Cort=0
a=1
b<- y.n <- NULL

for (i in x.levels) {
  y.n[i] <- length(y[group==i])
}

for (i in 1:k) {
  b[i] = i-1
  Cort=Cort+y.n[i]*(i-1)/n
}

for (i in 1:k) {
Cvar=Cvar+y.n[i]*(b[i]-Cort)^2
}

r <- rank(y)

' Calculating aST '
for (i in 1:n){
  if (r[i]<=((n+1)/4))
    aST[i]=r[i]-(n+1)/4
  else if (r[i]>=(3*(n+1)/4))
    aST[i]=r[i]-(3*(n+1)/4)
  else
    aST[i]=0
}


for (i in 1:k) {
  for (j in 1:y.n[i]){
    LST=LST+b[i]*aST[a]
    a=a+1
}}

EST=n*Cort*mean(aST)
VST=Cvar*var(aST)
Z=(LST-EST)/sqrt(VST)

p.value=1-pnorm(Z, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)


if (verbose) {
  cat("---------------------------------------------------------","\n", sep = " ")
  cat("  Test :", METHOD, "\n", sep = " ")
  cat("  data :", DNAME, "\n\n", sep = " ")
  cat("  Statistic =", LST, "\n", sep = " ")
  cat("  Mean =", EST, "\n", sep = " ")
  cat("  Variance =", VST, "\n", sep = " ")
  cat("  Z =", Z, "\n", sep = " ")
  cat("  Asymp. p-value =", p.value, "\n\n", sep = " ")
  cat(if (p.value > alpha) {"  Result : Null hypothesis is not rejected."}
      else {"  Result : Null hypothesis is rejected."}, "\n")
  cat("---------------------------------------------------------","\n\n", sep = " ")
}

result <- list()
result$statistic <- LST
result$mean <- EST
result$variance <- VST
result$Z <- Z
result$p.value <- p.value
result$alpha <- alpha
result$method <- METHOD
result$data <- data
result$formula <- formula
attr(result, "class") <- "owt"
invisible(result)
}
