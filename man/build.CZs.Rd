% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spatialize-fcns.R
\name{build.CZs}
\alias{build.CZs}
\title{build.CZs}
\usage{
build.CZs(.czs = NULL, crs = "+proj=lcc +lon_0=-90 +lat_1=33 +lat_2=45")
}
\arguments{
\item{.czs}{If not null, which CZs to build (5-char identifiers). Otherwise builds
all of them.}

\item{year}{passed onto \code{tigris::counties}}
}
\description{
CZs are groups of continguous counties. This function builds them from counties
downloaded from tigris
}
