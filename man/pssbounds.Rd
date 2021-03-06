% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pssbounds.r
\name{pssbounds}
\alias{pssbounds}
\title{pssbounds}
\usage{
pssbounds(obs, fstat, tstat = NULL, case, k)
}
\arguments{
\item{obs}{number of observations}

\item{fstat}{value of the F-statistic}

\item{tstat}{value of the t-statistic}

\item{case}{case number}

\item{k}{number of regressors appearing in lag levels}
}
\value{
None
}
\description{
display the necessary critical values to conduct the
Pesaran, Shin and Smith 2001 bounds test for cointegration.
See \url{http://andyphilips.github.io/pssbounds/}.
}
\details{
pssbounds is a module to display the necessary critical values to conduct the Pesaran, Shin and Smith (2001) bounds test for cointegration. Critical values using the F-test are the default; users can also include the critical values of the t-test with the tstat parameter.

As discussed in Philips (2016), the upper and lower bounds of the cointegration test are non-standard, and depend on the number of observations, the number of regressors appearing in levels, and the restrictions (if any) placed on the intercept and trend. Asymptotic critical values are provided by Pesaran, Shin, and Smith (2001), and small-sample critical values by Narayan (2005). The following five cases are possible: I (no intercept, no trend), II (restricted intercept, no trend), III (unrestricted intercept, no trend), IV (unrestricted intercept, restricted trend), V (unrestricted intercept, unrestricted trend). See Pesaran, Shin and Smith (2001) for more details; Case III is the most common.

More details are available at \url{http://andyphilips.github.io/pssbounds/}.
}
\examples{
library(MASS)
library(car)
data("airquality")
d.wind <- c(NA,diff(airquality$Wind))
d.temp <- c(NA,diff(airquality$Temp))
l.wind <- lag(airquality$Wind, k = 1)
l.temp <- lag(airquality$Temp, k = 1)
cbind(d.wind,d.temp,l.wind,l.temp)

# Run ECM on first difference of temp and lagged-levels of temp and wind (white-noise residuals assumed):
res <- lm(d.temp  ~ l.temp + l.wind +  d.wind)
summary(res) # t-stat on l.temp = 4.438

linearHypothesis(res, c('l.temp','l.wind = 0')) # 9.8789

pssbounds(case = 3, fstat = 9.879, tstat = 4.438, obs = 153, k = 2)
# F-stat concludes I(1) and cointegrating, t-stat concludes I(0).

# same model excluding constant:
res <- lm(d.temp  ~ l.temp + l.wind +  d.wind -1)
summary(res) # t-stat = 1.445
linearHypothesis(res, c('l.temp','l.wind = 0')) # 1.045
pssbounds(case = 2, tstat = 1.445, fstat = 1.045, obs = 153, k = 2)
# F-stat concludes I(0)

}
\author{
Soren Jordan, \email{sorenjordanpols@gmail.com}, \url{sorenjordan.com}

Andrew Q Philips, \email{aphilips@pols.tamu.edu}, \url{people.tamu.edu/~aphilips/}
}
\references{
If you use pssbounds, please cite:

Jordan, Soren and Andrew Q. Philips. "pss: Perform bounds test for cointegration and perform dynamic simulations."

and

Philips, Andrew Q. "Have your cake and eat it too? Cointegration and dynamic inference from autoregressive distributed lag models" Working Paper.

Narayan, Paresh Kumar. 2005. "The Saving and Investment Nexus for China: Evidence from Cointegration Tests." Applied Economics 37(17):1979-1990.

Pesaran, M Hashem, Yongcheol Shin and Richard J Smith. 2001. "Bounds testing approaches to the analysis of level relationships." Journal of Applied Econometrics 16(3):289-326.
}
\keyword{ARDL}
\keyword{bounds}
\keyword{cointegration,}
\keyword{test,}

