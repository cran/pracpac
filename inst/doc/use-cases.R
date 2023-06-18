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
#  ## copy the example hellow package to the temp directory
#  dir_copy(path = system.file("hellow", package = "pracpac"), new_path = path(tmp, "example", "hellow"))

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

## ---- eval=FALSE--------------------------------------------------------------
#  library(pracpac)
#  library(fs)
#  
#  ## specify the temp directory
#  tmp <- tempdir()
#  ## copy the example ocf package to the temp directory
#  dir_copy(path = system.file("ocf", package = "pracpac"), new_path = path(tmp, "example", "ocf"))

## ---- eval=FALSE--------------------------------------------------------------
#  dir_tree(path(tmp, "example", "ocf"), recurse = TRUE)

## ---- results='hide', eval=FALSE----------------------------------------------
#  use_docker(pkg_path = path(tmp, "example", "ocf"), use_case = "shiny")

## ---- eval=FALSE--------------------------------------------------------------
#  dir_tree(path(tmp, "example", "ocf"), recurse = TRUE)

## ---- eval=FALSE, echo=FALSE--------------------------------------------------
#  # actually make those changes! don't echo and don't eval. need to edit app.R
#  file_copy(system.file("example/ocf/app.R", package = "pracpac"), path(tmp, "example/ocf/docker/assets/app.R"), overwrite=TRUE)

## ----eval=FALSE, echo=TRUE, code=readLines(system.file("example", "ocf", "app.R", package = "pracpac"))----
#  library(shiny)
#  library(ocf)
#  
#  # Define UI for application that draws a histogram
#  ui <- fluidPage(
#  
#    # Application title
#    titlePanel("Old Faithful Geyser Data (In Color!)"),
#  
#    # Sidebar with a slider input for number of bins
#    sidebarLayout(
#      sidebarPanel(
#        sliderInput("bins",
#                    "Number of bins:",
#                    min = 1,
#                    max = 50,
#                    value = 30),
#        actionButton(inputId = "color", label = "Add Color")
#      ),
#  
#      # Show a plot of the generated distribution
#      mainPanel(
#        plotOutput("distPlot")
#      )
#    )
#  )
#  
#  # Define server logic required to draw a histogram
#  server <- function(input, output) {
#  
#    color_palette <- eventReactive(input$color, {
#      get_pal()
#    })
#  
#    output$distPlot <- renderPlot({
#      # generate bins based on input$bins from ui.R
#      x    <- faithful[, 2]
#      bins <- seq(min(x), max(x), length.out = input$bins + 1)
#  
#      # draw the histogram with the specified number of bins
#      hist(x,
#           breaks = bins,
#           col = color_palette()[[1]][1],
#           border = color_palette()[[1]][5],
#           main = paste0("Histogram in ", names(color_palette())))
#    })
#  }
#  
#  # Run the application
#  shinyApp(ui = ui, server = server)

## ---- eval=FALSE--------------------------------------------------------------
#  build_image(pkg_path = path(tmp, "example", "ocf"))

## ---- eval=FALSE--------------------------------------------------------------
#  system("docker images")

## ---- eval = FALSE------------------------------------------------------------
#  system("docker run --rm -it -d --user shiny -p 3838:3838 ocf:0.1.0")

## ---- echo=FALSE, eval=FALSE--------------------------------------------------
#  ## cleanup needed in case on vignette rebuild the same tmp directory is picked
#  dir_delete(path = path(tmp, "example"))

