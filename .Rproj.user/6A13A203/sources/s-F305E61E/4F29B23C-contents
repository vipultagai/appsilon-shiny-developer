# Function to generate kpi indicator.

distance_module_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    #link custom stylesheet
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "ui.css")
    ),
    
    #add title of the app
    tags$div(class = "app_title", titlePanel("Appsilon Shiny Developer Task")),
    
    #add sidebar with select inputs for type & name
    tags$div(class = "sidebar",
             tags$div(
               selectInput(ns("type"), "SHIP TYPE", choices = ""),
               selectInput(ns("name"), "SHIP NAME", choices = "")
             )),
    
    #add Map output
    tags$div(
      class = "plot_output_large",
      tags$div(
        class = "name",
        tags$div(style = "width:70%;float:left", textOutput(ns("title")))
      ),
      
      tags$div(leafletOutput(ns("map"), height = 400))
    ),
    
    #add description output
    tags$div(
      class = "description",
      tags$div(
        class = "name",
        tags$div(style = "width:70%;float:left", textOutput(ns(
          "description_title"
        )))
      ),
      
      tags$div(class = "text_container",
               uiOutput(ns("description")))
    )
    
    
  )
}
