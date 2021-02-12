# shiny_developer_appsilon
Repo for Shiny Developer @ Appsilon task.

  Demo Link: https://vipultagai.shinyapps.io/shiny_developer_appsilon/

 NOTE: The task is imlpemented as a single module in a shiny app.

# Directory Structure & Files
         - 1. server.R: shinyserver file.
         
         - 2. ui.R: shinyui file.
         
         - 3. global.R: to load libraries & source modules.
         
         - 4. www/ui.css: CSS file for styling.
         
         - 5. src/distance_module_ui.R : 
         Contains function to generate the required UI for the task module.
         
         - 6. src/distance_module_server.R : 
         Server logic for task module. (update select type, select name, render map & description. )
         
         - 7. src/ships.csv : 
         file without unnecessary columns (contains only 5 columns - SHIPTYPE, SHIPNAME, LAT, LON, DATETIME) (size: 176 MB) 
         
         - 8. src/utilities.R : Utility functions for calculations:
         
            8.1. get_ship_types() - 
            returns: list of ship types available in the data.
            
            8.2. get_ship_names(ship_type) - 
            returns: list of ship names belonging to ship type (passed as an argument) available in the data.
            
            8.3. get_distance(lattitude_1, lattitude_2, longitude_1, longitude_2) - 
            returns: distance between two points on surface of earth given coordinates in lattitude &   longitude.
            
            8.4. filter_data(ship_name) - 
            returns: dataframe with all observations belonging to a ship (ship_name).
            
            8.5. find_observations(filtered_data, type = max / total) - 
            returns:  if type = total -> the total distance covered by a ship &  
                      if type = max -> the observation with longest distance between two consecutive observations.  
                      
            8.6. make_map(observation, filtered_data) - 
            returns: leaflet map object with marked coordinates for problem statement & route of the ship.  
            
            8.7. make_description(ship_type) - 
            returns: A string with the description of the observations for the problem statement.
  
Use renv::restore() after pull.

Kindly install the following packages:
1. shiny
3. shiny.semantic
4. dplyr
5. leaflet
6. geosphere
7. renv


 In case shinyapps.io is down, please mail @ vipul8t@gmail.com

## Demonstration
![alt text](https://github.com/vipultagai/appsilon-shiny-developer/blob/master/demo.PNG)

