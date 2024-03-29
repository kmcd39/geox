% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tigris-fcns.R
\name{water.wrapper}
\alias{water.wrapper}
\title{water.wrapper}
\usage{
water.wrapper(x = NULL, .countyfps = NULL, size.min = 5e+06, ...)
}
\arguments{
\item{x}{\code{sf} or \code{bbox} object spanning area you want to filter polys to. Will use
get intersection if sf object or crop if bbox.}

\item{.countyfps}{Alternative to x, countyfp (as 5-char characters) to get areas
for.}

\item{size.min}{Minimum size in m^2, after internal boundaries are resolved (if a
water area is represented by multiple contiguous polygons)}

\item{...}{passed onto \code{query.fcn}}
}
\value{
water areas for region.
}
\description{
Gets water areas based on supplied countyfp codes and/or other spatial area.
}
