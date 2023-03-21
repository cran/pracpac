## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  warning = FALSE,
  message = FALSE,
  comment = "#>"
)
options(rmarkdown.html_vignette.check_title = FALSE)

## ---- eval=FALSE--------------------------------------------------------------
#  system.file("hellow", package = "pracpac")

## ---- eval=FALSE--------------------------------------------------------------
#  library(pracpac)
#  library(fs)
#  
#  ## specify the temp directory
#  tmp <- tempdir()
#  ## create a subdirectory of temp called "example"
#  dir_create(path = path(tmp, "example"))
#  ## copy the example hellow package to the temp directory
#  dir_copy(path = system.file("hellow", package = "pracpac"), new_path = path(tmp, "example"))

## ---- eval=FALSE--------------------------------------------------------------
#  use_docker(pkg_path = path(tmp, "example", "hellow"))

## ---- eval = FALSE------------------------------------------------------------
#  use_docker(pkg_path = path(tmp, "example", "hellow"), img_path = path(tmp, "example"))

## ---- eval=FALSE--------------------------------------------------------------
#  build_image(pkg_path = path(tmp, "example", "hellow"))

## ---- eval=FALSE--------------------------------------------------------------
#  system("docker images")

