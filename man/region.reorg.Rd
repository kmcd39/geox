% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/region-reorg-fcns.R
\name{region.reorg}
\alias{region.reorg}
\title{region.reorg}
\usage{
region.reorg(x, region.str, abvcols = T)
}
\arguments{
\item{x}{df to reorg}

\item{region.str}{string identifier existing region id column}

\item{abvcols}{whether to abbreviate region id columns}
}
\description{
Reorganizes by region. Shifts from
cz/cbsa/county identifier columns to region.type/region.id identifier columns.
}
