
#server logic for module
distance_module_server <- function(id) {
  moduleServer(id,
               function(input, output, session) {
                 
                 toast(
                   "Radius of earth is assumed to be 6,357,000 metres for distance calculation",
                   title = "Please Note",
                   action = NULL,
                   duration = 5,
                   id = "notification",
                   class = "",
                   toast_tags = NULL,
                   session = shiny::getDefaultReactiveDomain()
                 )
                 
                 #update choices for ship type
                 updateSelectInput(
                   session = getDefaultReactiveDomain(),
                   "type",
                   label = "Type",
                   choices = get_ship_type()$ship_type,
                   selected = NULL
                 )
                 #update choices for ship name according to ship type
                 observeEvent(input$type, {
                   req(input$type)
                   updateSelectInput(
                     session = getDefaultReactiveDomain(),
                     "name",
                     label = "Name",
                     choices = get_ship_names(input$type)$SHIPNAME,
                     selected = NULL
                   )
                 })
                 
                 #update title of map
                 output$title <- renderText("Ship Observation Task")
                 
                 #update description title
                 output$description_title <- renderText("Description")
                 
                 #Generate & display map/description
                 observeEvent(input$name, {
                   req(input$name)
                   obs <- filter_data(input$name)
                   result <- find_observations(obs)
                   output$map <- renderLeaflet(make_map(result, obs))
                   output$description <- renderUI ({
                     return(tags$p(make_description(result, obs)))
                   })
                 })
                 
               })
}
