% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{pkg_root}
\alias{pkg_root}
\title{Find package root}
\usage{
pkg_root(pkg_path = ".", ...)
}
\arguments{
\item{pkg_path}{Path to the package directory. Default is \code{"."} for the current working directory, which assumes developer is working in R package root. However, this can be set to another path as needed.}

\item{...}{Arguments passed to \link[rprojroot:find_root_file]{rprojroot::find_package_root_file}.}
}
\value{
A file path of the package root. If no package is found at the root then the function will \code{stop} with an error message.
}
\description{
Unexported helper to find the root of the R package. Returns an error if the path specified is not an R package.
}
