\name{geom_blank}
\alias{geom_blank}
\title{Blank, draws nothing.}
\usage{
  geom_blank(mapping = NULL, data = NULL,
    stat = "identity", position = "identity", ...)
}
\arguments{
  \item{mapping}{The aesthetic mapping, usually constructed
  with \code{\link{aes}} or \code{\link{aes_string}}. Only
  needs to be set at the layer level if you are overriding
  the plot defaults.}

  \item{data}{A layer specific dataset - only needed if you
  want to override the plot defaults.}

  \item{stat}{The statistical transformation to use on the
  data for this layer.}

  \item{position}{The position adjustment to use for
  overlappling points on this layer}

  \item{...}{other arguments passed on to
  \code{\link{layer}}. This can include aesthetics whose
  values you want to set, not map. See \code{\link{layer}}
  for more details.}
}
\description{
  The blank geom draws nothing, but can be a useful way of
  ensuring common scales between different plots.
}
\examples{
qplot(length, rating, data = movies, geom = "blank")
# Nothing to see here!

# Take the following scatter plot
a <- ggplot(mtcars, aes(x = wt, y = mpg), . ~ cyl) + geom_point()
# Add to that some lines with geom_abline()
df <- data.frame(a = rnorm(10, 25), b = rnorm(10, 0))
a + geom_abline(aes(intercept = a, slope = b), data = df)
# Suppose you then wanted to remove the geom_point layer
# If you just remove geom_point, you will get an error
b <- ggplot(mtcars, aes(x = wt, y = mpg), . ~ cyl)
\donttest{b + geom_abline(aes(intercept = a, slope = b), data = df)}
# Switching to geom_blank() gets the desired plot
c <- ggplot(mtcars, aes(x = wt, y = mpg), . ~ cyl) + geom_blank()
c + geom_abline(aes(intercept = a, slope = b), data = df)
}

