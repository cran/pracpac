% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/docker.R
\name{add_assets}
\alias{add_assets}
\title{Add assets for the specified use case}
\usage{
add_assets(
  pkg_path = ".",
  img_path = NULL,
  use_case = "default",
  overwrite = TRUE
)
}
\arguments{
\item{pkg_path}{Path to the package directory. Default is \code{"."} for the current working directory, which assumes developer is working in R package root. However, this can be set to another path as needed.}

\item{img_path}{Path to the write the docker image definition contents. The default \code{NULL} will use \verb{docker/} as a subdirectory of the \code{pkg_path}.}

\item{use_case}{Name of the use case. Defaults to \code{"default"}, which only uses the base boilerplate.}

\item{overwrite}{Logical; should existing assets should be overwritten? Default is \code{TRUE}.}
}
\value{
Invisibly returns assets per \link{handle_use_case}. Called primarily for its side effects.
}
\description{
Add template assets for the use case specified in \link{add_dockerfile} or \link{use_docker}.
}
\details{
Example #1: the \code{"shiny"} use case requires than an \code{app.R} file moved into
\verb{/srv/shiny-server/} in the container image. Using \code{add_assets(use_case="shiny")}
(or when using the \code{"shiny"} use case in \link{add_dockerfile} or \link{use_docker})
will create a placeholder \code{assets/app.R} in the \verb{docker/} directory. The
Dockerfile for the \code{"shiny"} use case will place \verb{COPY assets/app.R/srv/shiny-server} into the Dockerfile.

Example #2: the \code{"pipeline"} use case creates boilerplate for moving pre- and
post-processing R and shell scripts into the container at
\code{add_assets(use_case="pipeline")} (or when using the \code{"pipeline"} use case in
\link{add_dockerfile} or \link{use_docker}) will create a placeholder \code{assets/pre.R},
\code{assets/post.R}, and \code{assets/run.sh} into the \code{docker/assets} directory. The
Dockerfile for the \code{"pipeline"} use case will place \verb{COPY assets/run.sh /run.sh} into the Dockerfile.

This function is run as part of \link{use_docker} but can be used on its own.

See \code{vignette("use-cases", package="pracpac")} for details on use cases.
}
\examples{
\dontrun{

# Specify path to example package source and copy to tempdir()
# Note that in practice you do not need to copy to a tempdir()
# And in fact it may be easiest to use pracpac relative to your package directory root
ex_pkg_src <- system.file("hellow", package = "pracpac", mustWork = TRUE)
file.copy(from = ex_pkg_src, to = tempdir(), recursive = TRUE)

# Add assets for shiny use case
add_assets(pkg_path = file.path(tempdir(), "hellow"), use_case="shiny")
# Add assets for pipeline use case
add_assets(pkg_path = file.path(tempdir(), "hellow"), use_case="pipeline")
}
}
