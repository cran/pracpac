## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  warning = FALSE,
  message = FALSE,
  comment = ""
)
options(rmarkdown.html_vignette.check_title = FALSE)

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
#  dir_tree(path(tmp, "example", "hellow"), recurse = TRUE)

## ---- results='hide', eval=FALSE----------------------------------------------
#  use_docker(pkg_path = path(tmp, "example", "hellow"), use_case = "pipeline")

## ---- eval=FALSE--------------------------------------------------------------
#  dir_tree(path(tmp, "example", "hellow"), recurse = TRUE)

## ---- eval=FALSE, echo=FALSE--------------------------------------------------
#  # actually make those changes! don't echo and don't eval. because you're
#  # creating the file at tmp from the template, which includes post.R, you can't
#  # just run this code interactively because post.R won't exist, the actual
#  # dockerfile at tmp remains unchanged so copy in the "final" dockerfile and
#  # assets into the tmp dir so the docker build works properly below when running
#  # interactively, without having to actually monkey with the files in tmp, and so
#  # after the container is built it actually has the assets, entrypoint, etc.
#  file_copy(system.file("example/hellow/Dockerfile", package = "pracpac"), path(tmp, "example/hellow/docker/Dockerfile"), overwrite=TRUE)
#  file_copy(system.file("example/hellow/pre.R", package = "pracpac"), path(tmp, "example/hellow/docker/assets/pre.R"), overwrite=TRUE)
#  file_copy(system.file("example/hellow/run.sh", package = "pracpac"), path(tmp, "example/hellow/docker/assets/run.sh"), overwrite=TRUE)

## ----eval=FALSE, echo=TRUE, code=readLines(system.file("example", "hellow", "pre.R", package = "pracpac"))----
#  library(hellow)
#  
#  isay()

## ---- eval=FALSE--------------------------------------------------------------
#  file_delete(path(tmp, "example", "hellow", "docker", "assets", "post.R"))

## ---- eval=FALSE--------------------------------------------------------------
#  build_image(pkg_path = path(tmp, "example", "hellow"))

## ---- eval=FALSE--------------------------------------------------------------
#  system("docker images")

## ---- eval = FALSE------------------------------------------------------------
#  system("docker run --rm hellow:latest")

## ---- eval = FALSE------------------------------------------------------------
#  system("docker run --rm hellow:latest :es")

## ---- echo=FALSE, eval=FALSE--------------------------------------------------
#  ## cleanup needed in case on vignette rebuild the same tmp directory is picked
#  dir_delete(path = path(tmp, "example"))

