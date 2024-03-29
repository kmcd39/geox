% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/other-shpfile-queries.R
\name{osm.query}
\alias{osm.query}
\title{osm.query}
\usage{
osm.query(basesf, features)
}
\arguments{
\item{basesf}{sf object to query osm over bbox of}

\item{features}{osm features to request. See \code{?add_osm_feature} or
https://wiki.openstreetmap.org/wiki/Map_Features}
}
\description{
Extracts bbox from supplied base sf, formats for osm api and extracts
requested features.
}
\examples{
\dontrun{phr <- osm.query(divDat::czs[1,], "railway") }
}
